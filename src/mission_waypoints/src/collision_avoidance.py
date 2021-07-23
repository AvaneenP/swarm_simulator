#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class CollisionAvoid():
  def __init__(self):
    # Create the publisher and subscriber
    self.gps_loc1_sub = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.gps_loc2_sub = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.gps_loc3_sub = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.velocity_wayp1_sub = rospy.Subscriber('/uav1/input/velocity', Vector3, self.get_wayp1, queue_size = 1)
    self.velocity_wayp2_sub = rospy.Subscriber('/uav2/input/velocity', Vector3, self.get_wayp2, queue_size = 1)
    self.velocity_wayp3_sub = rospy.Subscriber('/uav3/input/velocity', Vector3, self.get_wayp3, queue_size = 1)

    self.influence_sphere = rospy.Subscriber('/uav1/sphere_of_influence/obj_detected', String, self.check_for_obstacle, queue_size = 1)

    self.velocity1_pub = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.velocity2_pub = rospy.Publisher('/uav2/input/velocity', Vector3, queue_size=1)
    self.velocity3_pub = rospy.Publisher('/uav3/input/velocity', Vector3, queue_size=1)

    self.curr_loc1 = PoseStamped()
    self.curr_loc2 = PoseStamped()
    self.curr_loc3 = PoseStamped()

    self.vel_wayp1 = Vector3()
    self.vel_wayp2 = Vector3()
    self.vel_wayp3 = Vector3()

    self.obj_detected = String()

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

  def get_wayp1(self, msg):
    self.vel_wayp1 = copy.deepcopy(msg)

  def get_wayp2(self, msg):
    self.vel_wayp2 = copy.deepcopy(msg)

  def get_wayp3(self, msg):
    self.vel_wayp3 = copy.deepcopy(msg)

  def check_for_obstacle(self, msg):
    self.obj_detected.data = msg.data

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)

    # While ROS is still running
    while not rospy.is_shutdown():        


      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('collision_avoid_node')
  try:
    ktp = CollisionAvoid()
  except rospy.ROSInterruptException:
    pass