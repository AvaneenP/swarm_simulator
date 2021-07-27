#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class SwarmAlignment():
  def __init__(self):
    self.vel1 = Vector3()
    self.vel2 = Vector3()
    self.vel3 = Vector3()
    
    # Create the publisher and subscriber
    self.vel_sub1 = rospy.Subscriber('/uav1/input/velocity', Vector3, self.get_vel1, queue_size = 1)
    self.vel_sub2 = rospy.Subscriber('/uav2/input/velocity', Vector3, self.get_vel2, queue_size = 1)
    self.vel_sub3 = rospy.Subscriber('/uav3/input/velocity', Vector3, self.get_vel3, queue_size = 1)

    self.align_velocity_pub1 = rospy.Publisher('/uav1/input/unverified_align_velocity', Vector3, queue_size=1)
    self.align_velocity_pub2 = rospy.Publisher('/uav2/input/unverified_align_velocity', Vector3, queue_size=1)
    self.align_velocity_pub3 = rospy.Publisher('/uav3/input/unverified_align_velocity', Vector3, queue_size=1)



    self.align_vel = Vector3()

    self.align_v_w = rospy.get_param("/alignment_node/align_v_w", 0.5)
    print("weight of the 'align' vector is: " + str(self.align_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_vel1(self, msg):
    self.vel1 = copy.deepcopy(msg)

  def get_vel2(self, msg):
    self.vel2 = copy.deepcopy(msg)

  def get_vel3(self, msg):
    self.vel3 = copy.deepcopy(msg)


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():
      
      self.avg_x_vel = self.vel1.x + self.vel2.x + self.vel3.x
      self.avg_y_vel = self.vel1.y + self.vel2.y + self.vel3.y
      self.avg_z_vel = self.vel1.z + self.vel2.z + self.vel3.z

      self.align_vel.x = self.avg_x_vel / 3 * self.align_v_w
      self.align_vel.x = self.avg_y_vel / 3 * self.align_v_w
      self.align_vel.x = self.avg_z_vel / 3 * self.align_v_w

      self.align_velocity_pub1.publish(self.align_vel)
      self.align_velocity_pub2.publish(self.align_vel)
      self.align_velocity_pub3.publish(self.align_vel)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('alignment_node')
  try:
    ktp = SwarmAlignment()
  except rospy.ROSInterruptException:
    pass