#!/usr/bin/env python
import rospy
import time
import copy
import math

from std_msgs.msg import String

from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import TransformStamped
from geometry_msgs.msg import Point

from mission_waypoints.msg import swarm_gps

'''
Calculates "centering" velocity whenever the uav is outside the virtual cage
Publishes "centering" velocity to uavName/input/center_vel
'''
# Cage - {3, 3, 2}

class SafetyCage():
  def __init__(self):
    
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.center_pub = rospy.Publisher(self.uavName + '/input/center_vel', Vector3, queue_size = 1)

    self.curr_pos = PoseStamped()

    self.center_vel = Vector3()
    self.center_vel.x = 0
    self.center_vel.y = 0
    self.center_vel.z = 0

    # Call the mainloop of our class
    self.mainloop()
  
  # Callback for current location
  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z


  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.0)

    # While ROS is still running
    while not rospy.is_shutdown():
      
      if self.curr_pos.pose.position.x > 3:
        self.center_vel.x = (self.curr_pos.pose.position.x - 3) * -2 
      if self.curr_pos.pose.position.x < -3:
        self.center_vel.x = (self.curr_pos.pose.position.x + 3) * -2 

      if self.curr_pos.pose.position.y > 3:
        self.center_vel.y = (self.curr_pos.pose.position.y - 3) * -2 
      if self.curr_pos.pose.position.y < -3:
        self.center_vel.y = (self.curr_pos.pose.position.y + 3) * -2

      if self.curr_pos.pose.position.z > 2:
        self.center_vel.z = (self.curr_pos.pose.position.z - 2) * -2 
      if self.curr_pos.pose.position.z < 0:
        self.center_vel.z = (self.curr_pos.pose.position.z) * -2 

      self.center_pub.publish(self.center_vel)

      self.center_vel.x = 0
      self.center_vel.y = 0
      self.center_vel.z = 0

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('safety_cage_node')
  try:
    ktp = SafetyCage()
  except rospy.ROSInterruptException:
    pass