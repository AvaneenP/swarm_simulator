#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class VelocityPublisher():
  def __init__(self):

    self.vel1 = Vector3()
    self.vel2 = Vector3()
    self.vel3 = Vector3()

    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    self.wayp1 = Vector3()
    self.wayp2 = Vector3()
    self.wayp3 = Vector3()
      
    # Create the publisher and subscriber
    self.uav1_wayp = rospy.Subscriber('/uav1/waypoint', Vector3, self.get_wayp1, queue_size = 1)
    self.uav2_wayp = rospy.Subscriber('/uav2/waypoint', Vector3, self.get_wayp2, queue_size = 1)
    self.uav3_wayp = rospy.Subscriber('/uav3/waypoint', Vector3, self.get_wayp3, queue_size = 1)

    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.velocity_pub1 = rospy.Publisher('/uav1/input/unverified_goal_velocity', Vector3, queue_size=1)
    self.velocity_pub2 = rospy.Publisher('/uav2/input/unverified_goal_velocity', Vector3, queue_size=1)
    self.velocity_pub3 = rospy.Publisher('/uav3/input/unverified_goal_velocity', Vector3, queue_size=1)




    self.goal_v_w = rospy.get_param("/velocity_pub_node/goal_v_w", 0.5)
    print("weight of the 'goal' vector is: " + str(self.goal_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_wayp1(self, msg):
    self.wayp1 = copy.deepcopy(msg)

  def get_wayp2(self, msg):
    self.wayp2 = copy.deepcopy(msg)

  def get_wayp3(self, msg):
    self.wayp3 = copy.deepcopy(msg)

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

      self.vel1.x = (self.wayp1.x - self.curr_pos1.pose.position.x) * self.goal_v_w
      self.vel1.y = (self.wayp1.y - self.curr_pos1.pose.position.y) * self.goal_v_w
      self.vel1.z = (self.wayp1.z - self.curr_pos1.pose.position.z) * self.goal_v_w

      self.vel2.x = (self.wayp2.x - self.curr_pos2.pose.position.x) * self.goal_v_w
      self.vel2.y = (self.wayp2.y - self.curr_pos2.pose.position.y) * self.goal_v_w
      self.vel2.z = (self.wayp2.z - self.curr_pos2.pose.position.z) * self.goal_v_w

      self.vel3.x = (self.wayp3.x - self.curr_pos3.pose.position.x) * self.goal_v_w
      self.vel3.y = (self.wayp3.y - self.curr_pos3.pose.position.y) * self.goal_v_w
      self.vel3.z = (self.wayp3.z - self.curr_pos3.pose.position.z) * self.goal_v_w

      self.velocity_pub1.publish(self.vel1)
      self.velocity_pub2.publish(self.vel2)
      self.velocity_pub3.publish(self.vel3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('velocity_pub_node')
  try:
    ktp = VelocityPublisher()
  except rospy.ROSInterruptException:
    pass