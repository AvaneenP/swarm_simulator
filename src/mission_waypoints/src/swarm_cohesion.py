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

class PositionCohesion():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    
    self.curr_pos = PoseStamped()
    self.swarm_loc = swarm_gps()
    self.pos_vel = Vector3()
    self.nearby_uav = String()
    self.drone_positions = {}

    # Create the publisher and subscriber

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_position_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.nearby_uav_position = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_nearby_uav_name, queue_size = 1)

    self.position_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_position_velocity', Vector3, queue_size=1)


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
    self.swarm_loc = copy.deepcopy(msg)

  def get_nearby_uav_name(self, msg):
    self.nearby_uav = copy.deepcopy(msg)


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    self.avg_x_pos = 0
    self.avg_y_pos = 0
    self.count = 0

    # While ROS is still running
    while not rospy.is_shutdown():

      self.drone_positions[self.swarm_loc.name] = [self.swarm_loc.pos, self.swarm_loc.vel]

      if len(self.drone_positions.keys()) != 3:
        continue

      if self.nearby_uav.data != "":
        # getting an error where the key is ''. This shouldn't happen because of the if statement above. Very random to replicate
        # I added the if statement within the for loop (still haven't been able to consistently replicate error)
        for word in self.nearby_uav.data.split(","):
          if word == '':
            continue
          self.avg_x_pos += self.drone_positions[word][0].x
          self.avg_y_pos += self.drone_positions[word][0].y
          self.count += 1
      
        self.avg_x_pos += self.curr_pos.pose.position.x
        self.avg_y_pos += self.curr_pos.pose.position.y

        self.avg_x_pos = self.avg_x_pos / (self.count + 1)
        self.avg_y_pos = self.avg_y_pos / (self.count + 1)

        self.pos_vel.x =  (self.avg_x_pos - self.curr_pos.pose.position.x) * self.pos_v_w
        self.pos_vel.y =  (self.avg_y_pos - self.curr_pos.pose.position.y) * self.pos_v_w

      self.position_velocity_pub.publish(self.pos_vel)
      self.pos_vel.x = 0
      self.pos_vel.y = 0
      self.avg_x_pos = 0
      self.avg_y_pos = 0
      self.count = 0


      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('cohesion_node')
  try:
    ktp = PositionCohesion()
  except rospy.ROSInterruptException:
    pass