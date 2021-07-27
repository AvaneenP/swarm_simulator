#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class BoidsVectors():
  def __init__(self):
    self.goal_vel1 = Vector3()
    self.goal_vel2 = Vector3()
    self.goal_vel3 = Vector3()

    self.pos_vel1 = Vector3()
    self.pos_vel2 = Vector3()
    self.pos_vel3 = Vector3()

    self.away_vel1 = Vector3()
    self.away_vel2 = Vector3()
    self.align_vel2 = Vector3()
    self.align_vel3 = Vector3()

    self.final_vel1 = Vector3()
    self.final_vel2 = Vector3()
    self.final_vel3 = Vector3()

    # Create the publisher and subscriber
    self.final_velocity_pub1 = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.final_velocity_pub2 = rospy.Publisher('/uav2/input/velocity', Vector3, queue_size=1)
    self.final_velocity_pub3 = rospy.Publisher('/uav3/input/velocity', Vector3, queue_size=1)

    self.goal_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_goal_velocity', Vector3, self.get_goal_vec1, queue_size=1)
    self.goal_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_goal_velocity', Vector3, self.get_goal_vec2, queue_size=1)
    self.goal_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_goal_velocity', Vector3, self.get_goal_vec3, queue_size=1)

    self.position_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_position_velocity', Vector3, self.get_pos_vec1, queue_size=1)
    self.position_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_position_velocity', Vector3, self.get_pos_vec2, queue_size=1)
    self.position_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_position_velocity', Vector3, self.get_pos_vec3, queue_size=1)

    self.away_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_away_velocity', Vector3, self.get_away_vec1, queue_size=1)
    self.away_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_away_velocity', Vector3, self.get_away_vec2, queue_size=1)
    self.away_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_away_velocity', Vector3, self.get_away_vec3, queue_size=1)

    self.align_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_align_velocity', Vector3, self.get_align_vec1, queue_size=1)
    self.align_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_align_velocity', Vector3, self.get_align_vec2, queue_size=1)
    self.align_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_align_velocity', Vector3, self.get_align_vec3, queue_size=1)




    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_goal_vec1(self, msg):
    self.goal_vel1 = copy.deepcopy(msg)

  def get_goal_vec2(self, msg):
    self.goal_vel2 = copy.deepcopy(msg)

  def get_goal_vec3(self, msg):curr_pos1
    self.pos_vel1 = copy.deepcopy(msg)

  def get_pos_vec2(self, msg):
    self.pos_vel2 = copy.deepcopy(msg)

  def get_pos_vec3(self, msg):
    self.pos_vel3 = copy.deepcopy(msg)

  def get_away_vec1(self, msg):
    self.away_vel1 = copy.deepcopy(msg)

  def get_away_vec2(self, msg):
    self.away_vel1 = copy.deepcopy(msg)

  def get_away_vec3(self, msg):
    self.away_vel1 = copy.deepcopy(msg)

  def get_align_vec1(self, msg):
    self.align_vel1 = copy.deepcopy(msg)

  def get_align_vec2(self, msg):
    self.align_vel2 = copy.deepcopy(msg)

  def get_align_vec3(self, msg):
    self.align_vel3 = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.final_vel1.x = (self.goal_vel1.x + self.pos_vel1.x + self.away_vel1.x + self.align_vel1.x) / 4
      self.final_vel1.y = (self.goal_vel1.y + self.pos_vel1.y + self.away_vel1.y + self.align_vel1.y) / 4
      self.final_vel1.z = (self.goal_vel1.z + self.pos_vel1.z + self.away_vel1.z + self.align_vel1.z) / 4

      self.final_vel2.x = (self.goal_vel2.x + self.pos_vel2.x + self.away_vel2.x + self.align_vel2.x) / 4
      self.final_vel2.y = (self.goal_vel2.y + self.pos_vel2.y + self.away_vel2.y + self.align_vel2.y) / 4
      self.final_vel2.z = (self.goal_vel2.z + self.pos_vel2.z + self.away_vel2.z + self.align_vel2.z) / 4

      self.final_vel3.x = (self.goal_vel3.x + self.pos_vel3.x + self.away_vel3.x + self.align_vel3.x) / 4
      self.final_vel3.y = (self.goal_vel3.y + self.pos_vel3.y + self.away_vel3.y + self.align_vel3.y) / 4
      self.final_vel3.z = (self.goal_vel3.z + self.pos_vel3.z + self.away_vel3.z + self.align_vel3.z) / 4
      
      self.final_velocity_pub1.publish(self.final_vel1)
      self.final_velocity_pub2.publish(self.final_vel2)
      self.final_velocity_pub3.publish(self.final_vel3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('boids_node')
  try:
    ktp = BoidsVectors()
  except rospy.ROSInterruptException:
    pass