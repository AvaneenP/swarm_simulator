#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from mission_waypoints.msg import swarm_gps
from shapely.geometry import Polygon

class SwarmAlignment():
  def __init__(self):
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)
    self.align_v_w = rospy.get_param(str(rospy.get_name()) + "/align_v_w", 0.5)
    print("weight of the 'align' vector is: " + str(self.align_v_w))

    self.align_vel = Vector3()
    self.curr_vel = Vector3()
    self.swarm_loc = swarm_gps()
    self.nearby_uav = String()
    self.drone_positions = {}
    
    self.curr_pos = PoseStamped()
    self.uav_info = swarm_gps()
    self.uav_info.name = self.uavName
    
    # Create the publisher and subscriber
    self.vel_sub = rospy.Subscriber(self.uavName + '/input/velocity', Vector3, self.get_vel, queue_size = 1)

    self.swarm_vel_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_vel, queue_size = 1)

    self.nearby_uav_vel = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_nearby_uav_name, queue_size = 1)

    self.align_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_align_velocity', Vector3, queue_size=1)

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.uav_info_pub = rospy.Publisher(self.uavName + '/align_info', swarm_gps, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_vel(self, msg):
    self.curr_vel = copy.deepcopy(msg)

  def get_swarm_vel(self, msg):
    self.drone_positions[msg.name] = [msg.pos, msg.vel]

  def get_nearby_uav_name(self, msg):
    self.nearby_uav = copy.deepcopy(msg)

  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    self.avg_x_vel = 0
    self.avg_y_vel = 0
    self.avg_z_vel = 0
    self.count = 0

    # While ROS is still running
    while not rospy.is_shutdown():

      if len(self.drone_positions.keys()) != self.numUAVs:
        continue

      if self.nearby_uav.data != "":
        for word in self.nearby_uav.data.split(","):
          if word == '':
            continue
          self.avg_x_vel += self.drone_positions[word][1].x
          self.avg_y_vel += self.drone_positions[word][1].y
          self.avg_z_vel += self.drone_positions[word][1].z
          self.count += 1

        self.avg_x_vel += self.curr_vel.x
        self.avg_y_vel += self.curr_vel.y
        self.avg_z_vel += self.curr_vel.z

        self.align_vel.x = self.avg_x_vel / (self.count + 1) * self.align_v_w
        self.align_vel.y = self.avg_y_vel / (self.count + 1) * self.align_v_w
        self.align_vel.z = self.avg_z_vel / (self.count + 1) * self.align_v_w

      self.align_velocity_pub.publish(self.align_vel)

      self.uav_info.pos.x = self.curr_pos.pose.position.x
      self.uav_info.pos.y = self.curr_pos.pose.position.y
      self.uav_info.pos.z = self.curr_pos.pose.position.z

      self.uav_info.vel.x = self.align_vel.x
      self.uav_info.vel.y = self.align_vel.y
      self.uav_info.vel.z = self.align_vel.z

      self.uav_info_pub.publish(self.uav_info)

      self.align_vel.x = 0
      self.align_vel.y = 0
      self.align_vel.z = 0
      self.avg_x_vel = 0
      self.avg_y_vel = 0
      self.avg_z_vel = 0
      self.count = 0

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('alignment_node')
  try:
    ktp = SwarmAlignment()
  except rospy.ROSInterruptException:
    pass