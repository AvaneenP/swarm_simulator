#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class KeyboardVelocity():
  def __init__(self):
    # Create the publisher and subscriber
    self.keyboard_sub = rospy.Subscriber('/keyboard/keydown', Key, self.get_key, queue_size = 1)

    self.velocity_pub = rospy.Publisher('/uav1/input/unverified_velocity', Vector3, queue_size=1)

    self.velocity_waypoints = Vector3()
    self.velocity_waypoints.x = 0
    self.velocity_waypoints.y = 0
    self.velocity_waypoints.z = 0

    # Create a variable we will use to hold the key code
    self.key_code = -1

    # Call the mainloop of our class
    self.mainloop()
  
  # Callback for the keyboard sub
  def get_key(self, msg):
    self.key_code = msg.code

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(5)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.velocity_pub.publish(self.velocity_waypoints)

      self.velocity_waypoints.x = random.randint(-10,10)
      self.velocity_waypoints.y = random.randint(-10,10)
      self.velocity_waypoints.z = random.randint(-5,5)

      # West
      if self.key_code == Key.KEY_LEFT or self.key_code == Key.KEY_a:
        print("velocity x -1")
        self.velocity_waypoints.x -= 1
      # North
      if self.key_code == Key.KEY_UP or self.key_code == Key.KEY_w:
        print("velocity y +1")
        self.velocity_waypoints.y += 1
      # East
      if self.key_code == Key.KEY_RIGHT or self.key_code == Key.KEY_d:
        print("velocity x +1")
        self.velocity_waypoints.x += 1
      # South
      if self.key_code == Key.KEY_DOWN or self.key_code == Key.KEY_s:
        print("velocity y -1")
        self.velocity_waypoints.y -= 1
      # Up
      if self.key_code == Key.KEY_2:
        print("velocity z +1")
        self.velocity_waypoints.z += 1
      # Down
      if self.key_code == Key.KEY_1:
        print("velocity z -1")
        self.velocity_waypoints.z -= 1
      

      # Reset the code
      if self.key_code != -1:
        self.key_code = -1

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('keyboard_velocity_node')
  try:
    ktp = KeyboardVelocity()
  except rospy.ROSInterruptException:
    pass