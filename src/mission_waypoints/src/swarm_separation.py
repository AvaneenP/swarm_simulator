#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class SwarmSeparation():
  def __init__(self):

    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    self.away_vel1 = Vector3()
    self.away_vel2 = Vector3()
    self.away_vel3 = Vector3()

    # Create the publisher and subscriber
    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.away_velocity_pub1 = rospy.Publisher('/uav1/input/unverified_away_velocity', Vector3, queue_size=1)
    self.away_velocity_pub2 = rospy.Publisher('/uav2/input/unverified_away_velocity', Vector3, queue_size=1)
    self.away_velocity_pub3 = rospy.Publisher('/uav3/input/unverified_away_velocity', Vector3, queue_size=1)

    self.sep_v_w = rospy.get_param("/separation_node/sep_v_w", 0.5)
    print("weight of the 'separation' vector is: " + str(self.sep_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_pos1(self, msg):
    self.curr_pos1.pose.position.x = msg.pose.position.x
    self.curr_pos1.pose.position.y = msg.pose.position.y
    self.curr_pos1.pose.position.z = msg.pose.position.z

  def get_pos2(self, msg):
    self.curr_pos2.pose.position.x = msg.pose.position.x
    self.curr_pos2.pose.position.y = msg.pose.position.y
    self.curr_pos2.pose.position.z = msg.pose.position.z

  def get_pos3(self, msg):
    self.curr_pos3.pose.position.x = msg.pose.position.x
    self.curr_pos3.pose.position.y = msg.pose.position.y
    self.curr_pos3.pose.position.z = msg.pose.position.z


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():
      
      away_2_1_x = 1 / (self.curr_pos2.pose.position.x - self.curr_pos1.pose.position.x)
      away_2_1_y = 1 / (self.curr_pos2.pose.position.y - self.curr_pos1.pose.position.y)
      away_2_1_z = 1 / (self.curr_pos2.pose.position.z - self.curr_pos1.pose.position.z)

      away_1_2_x = -1 * away_2_1_x
      away_1_2_y = -1 * away_2_1_y
      away_1_2_z = -1 * away_2_1_z

      away_3_1_x = 1 / (self.curr_pos3.pose.position.x - self.curr_pos1.pose.position.x)
      away_3_1_y = 1 / (self.curr_pos3.pose.position.y - self.curr_pos1.pose.position.y)
      away_3_1_z = 1 / (self.curr_pos3.pose.position.z - self.curr_pos1.pose.position.z)

      away_1_3_x = -1 * away_3_1_x
      away_1_3_y = -1 * away_3_1_y
      away_1_3_z = -1 * away_3_1_z

      away_3_2_x = 1 / (self.curr_pos3.pose.position.x - self.curr_pos2.pose.position.x)
      away_3_2_y = 1 / (self.curr_pos3.pose.position.y - self.curr_pos2.pose.position.y)
      away_3_2_z = 1 / (self.curr_pos3.pose.position.z - self.curr_pos2.pose.position.z)

      away_2_3_x = -1 * away_3_2_x
      away_2_3_y = -1 * away_3_2_y
      away_2_3_z = -1 * away_3_2_z


      self.away_vel1.x = (away_1_2_x + away_1_3_x) * self.sep_v_w
      self.away_vel1.y = (away_1_2_y + away_1_3_y) * self.sep_v_w
      self.away_vel1.z = (away_1_2_z + away_1_3_z) * self.sep_v_w
      
      self.away_vel2.x = (away_2_1_x + away_2_3_x) * self.sep_v_w
      self.away_vel2.y = (away_2_1_y + away_2_3_y) * self.sep_v_w
      self.away_vel2.z = (away_2_1_z + away_2_3_z) * self.sep_v_w
      
      self.away_vel3.x = (away_3_1_x + away_3_2_x) * self.sep_v_w
      self.away_vel3.y = (away_3_1_y + away_3_2_y) * self.sep_v_w
      self.away_vel3.z = (away_3_1_z + away_3_2_z) * self.sep_v_w


      self.away_velocity_pub1.publish(self.away_vel1)
      self.away_velocity_pub2.publish(self.away_vel2)
      self.away_velocity_pub3.publish(self.away_vel3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('separation_node')
  try:
    ktp = SwarmSeparation()
  except rospy.ROSInterruptException:
    pass