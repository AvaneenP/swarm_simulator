#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class PositionCohesion():
  def __init__(self):
    
    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    self.pos_vel1 = Vector3()
    self.pos_vel2 = Vector3()
    self.pos_vel3 = Vector3()

    # Create the publisher and subscriber
    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.position_velocity_pub1 = rospy.Publisher('/uav1/input/unverified_position_velocity', Vector3, queue_size=1)
    self.position_velocity_pub2 = rospy.Publisher('/uav2/input/unverified_position_velocity', Vector3, queue_size=1)
    self.position_velocity_pub3 = rospy.Publisher('/uav3/input/unverified_position_velocity', Vector3, queue_size=1)



    self.pos_v_w = rospy.get_param("/cohesion_node/pos_v_w", 0.5)
    print("weight of the 'position' vector is: " + str(self.pos_v_w))

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
      
      self.avg_x_pos = self.curr_pos1.pose.position.x + self.curr_pos2.pose.position.x + self.curr_pos3.pose.position.x
      self.avg_y_pos = self.curr_pos1.pose.position.y + self.curr_pos2.pose.position.y + self.curr_pos3.pose.position.y
      self.avg_z_pos = self.curr_pos1.pose.position.z + self.curr_pos2.pose.position.z + self.curr_pos3.pose.position.z

      self.pos_vel1.x = (self.avg_x_pos - self.curr_pos1.pose.position.x) * self.pos_v_w
      self.pos_vel1.y = (self.avg_y_pos - self.curr_pos1.pose.position.y) * self.pos_v_w
      self.pos_vel1.z = (self.avg_z_pos - self.curr_pos1.pose.position.z) * self.pos_v_w

      self.pos_vel2.x = (self.avg_x_pos - self.curr_pos2.pose.position.x) * self.pos_v_w
      self.pos_vel2.y = (self.avg_y_pos - self.curr_pos2.pose.position.y) * self.pos_v_w
      self.pos_vel2.z = (self.avg_z_pos - self.curr_pos2.pose.position.z) * self.pos_v_w

      self.pos_vel3.x = (self.avg_x_pos - self.curr_pos3.pose.position.x) * self.pos_v_w
      self.pos_vel3.y = (self.avg_y_pos - self.curr_pos3.pose.position.y) * self.pos_v_w
      self.pos_vel3.z = (self.avg_z_pos - self.curr_pos3.pose.position.z) * self.pos_v_w

      self.position_velocity_pub1.publish(self.pos_vel1)
      self.position_velocity_pub2.publish(self.pos_vel2)
      self.position_velocity_pub3.publish(self.pos_vel3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('cohesion_node')
  try:
    ktp = PositionCohesion()
  except rospy.ROSInterruptException:
    pass