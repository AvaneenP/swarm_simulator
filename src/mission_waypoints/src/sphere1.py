#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class InfluenceSphere1():
  def __init__(self):
    # Create the publisher and subscriber
    self.gps_loc1_sub = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.gps_loc2_sub = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.gps_loc3_sub = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.sphere1 = rospy.Publisher('/uav1/sphere_of_influence/obj_detected', String, queue_size=1)

    self.curr_loc1 = PoseStamped()
    self.curr_loc2 = PoseStamped()
    self.curr_loc3 = PoseStamped()

    self.obj_detected = String()
    self.obj_detected.data = ""

    # Call the mainloop of our class
    self.mainloop()

  # Callback for current location
  def get_pos1(self, msg):
    self.curr_loc1.pose.position.x = msg.pose.position.x
    self.curr_loc1.pose.position.y = msg.pose.position.y
    self.curr_loc1.pose.position.z = msg.pose.position.z

  def get_pos2(self, msg):
    self.curr_loc2.pose.position.x = msg.pose.position.x
    self.curr_loc2.pose.position.y = msg.pose.position.y
    self.curr_loc2.pose.position.z = msg.pose.position.z

  def get_pos3(self, msg):
    self.curr_loc3.pose.position.x = msg.pose.position.x
    self.curr_loc3.pose.position.y = msg.pose.position.y
    self.curr_loc3.pose.position.z = msg.pose.position.z

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)

    # While ROS is still running
    while not rospy.is_shutdown():        

      diff_1and3 = math.sqrt( pow(self.curr_loc1.pose.position.x - self.curr_loc3.pose.position.x, 2) + pow(self.curr_loc1.pose.position.y - self.curr_loc3.pose.position.y, 2) + pow(self.curr_loc1.pose.position.z - self.curr_loc3.pose.position.z, 2) ) 
      
      diff_1and2 = math.sqrt( pow(self.curr_loc1.pose.position.x - self.curr_loc2.pose.position.x, 2) + pow(self.curr_loc1.pose.position.y - self.curr_loc2.pose.position.y, 2) + pow(self.curr_loc1.pose.position.z - self.curr_loc2.pose.position.z, 2) )

      if diff_1and2 < 1:
        self.obj_detected.data = "uav2"

      if diff_1and3 < 1:
        self.obj_detected.data = "uav3"
        
      self.sphere1.publish(self.obj_detected)
      self.obj_detected.data = ""

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('sphere_of_influence_node1')
  try:
    ktp = InfluenceSphere1()
  except rospy.ROSInterruptException:
    pass