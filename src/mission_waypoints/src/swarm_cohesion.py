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

'''
Calculates a uav's "cohesion" or "together" velocity based on other uavs in it's sphere of influence --> subscribed to uavName/sphere_of_influence

Publishes this new "cohesion" velocity to uavName/input_unverified_position_velocity

Publishes new "cohesion" velocity and current position to uavName/pos_info
'''

class PositionCohesion():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)
    
    self.curr_pos = PoseStamped()
    self.swarm_loc = swarm_gps()
    self.pos_vel = Vector3()
    self.nearby_uav = String()
    self.drone_positions = {}

    self.uav_info = swarm_gps()
    self.uav_info.name = self.uavName

    # Create the publisher and subscriber

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_position_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.nearby_uav_position = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_nearby_uav_name, queue_size = 1)

    self.position_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_position_velocity', Vector3, queue_size=1)

    self.uav_info_pub = rospy.Publisher(self.uavName + '/pos_info', swarm_gps, queue_size = 1)

    self.pos_v_w = rospy.get_param(str(rospy.get_name()) + "/pos_v_w", 0.5)
    print("Weight of the 'position' vector is: " + str(self.pos_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
    self.drone_positions[msg.name] = [msg.pos, msg.vel]

  def get_nearby_uav_name(self, msg):
    self.nearby_uav = copy.deepcopy(msg)


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.0)

    self.avg_x_pos = 0
    self.avg_y_pos = 0
    self.avg_z_pos = 0
    self.count = 0

    # While ROS is still running
    while not rospy.is_shutdown():

      if len(self.drone_positions.keys()) != self.numUAVs:
        continue

      if self.nearby_uav.data != "":
        # getting an error where the key is ''. This shouldn't happen because of the if statement above. Very random to replicate
        # I added the if statement within the for loop (still haven't been able to consistently replicate error)
        for word in self.nearby_uav.data.split(","):
          if word == '':
            continue
          self.avg_x_pos += self.drone_positions[word][0].x
          self.avg_y_pos += self.drone_positions[word][0].y
          self.avg_z_pos += self.drone_positions[word][0].z
          self.count += 1
      
        self.avg_x_pos += self.curr_pos.pose.position.x
        self.avg_y_pos += self.curr_pos.pose.position.y
        self.avg_z_pos += self.curr_pos.pose.position.z

        self.avg_x_pos = self.avg_x_pos / (self.count + 1)
        self.avg_y_pos = self.avg_y_pos / (self.count + 1)
        self.avg_z_pos = self.avg_z_pos / (self.count + 1)

        self.pos_vel.x =  (self.avg_x_pos - self.curr_pos.pose.position.x) * self.pos_v_w
        self.pos_vel.y =  (self.avg_y_pos - self.curr_pos.pose.position.y) * self.pos_v_w
        self.pos_vel.z =  (self.avg_z_pos - self.curr_pos.pose.position.z) * self.pos_v_w

      self.position_velocity_pub.publish(self.pos_vel)

      self.uav_info.pos.x = self.curr_pos.pose.position.x
      self.uav_info.pos.y = self.curr_pos.pose.position.y
      self.uav_info.pos.z = self.curr_pos.pose.position.z

      self.uav_info.vel.x = self.pos_vel.x
      self.uav_info.vel.y = self.pos_vel.y
      self.uav_info.vel.z = self.pos_vel.z

      self.uav_info_pub.publish(self.uav_info)

      self.pos_vel.x = 0
      self.pos_vel.y = 0
      self.pos_vel.z = 0
      self.avg_x_pos = 0
      self.avg_y_pos = 0
      self.avg_z_pos = 0
      self.count = 0


      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('cohesion_node')
  try:
    ktp = PositionCohesion()
  except rospy.ROSInterruptException:
    pass