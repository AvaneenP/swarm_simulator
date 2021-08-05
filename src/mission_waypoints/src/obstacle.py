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

class Obstacle():
  def __init__(self):

    self.obstacle = swarm_gps()
    self.obstacle.name = "Obstacle"

    self.obstacle.pos.x = 0
    self.obstacle.pos.y = 0
    self.obstacle.pos.z = 1.5

    self.obstacle.vel.x = 0
    self.obstacle.vel.y = 0
    self.obstacle.vel.z = 0


    self.obstacle2 = swarm_gps()
    self.obstacle2.name = "Obstacle2"

    self.obstacle2.pos.x = 2.5
    self.obstacle2.pos.y = 0
    self.obstacle2.pos.z = 1.5

    self.obstacle2.vel.x = 0
    self.obstacle2.vel.y = 0
    self.obstacle2.vel.z = 0

    self.obstacle3 = swarm_gps()
    self.obstacle3.name = "Obstacle3"

    self.obstacle3.pos.x = -2.5
    self.obstacle3.pos.y = 0
    self.obstacle3.pos.z = 1.5

    self.obstacle3.vel.x = 0
    self.obstacle3.vel.y = 0
    self.obstacle3.vel.z = 0

    # Create the publisher and subscriber
    self.uav_info_pub = rospy.Publisher('/swarm/gps', swarm_gps, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.uav_info_pub.publish(self.obstacle)
      self.uav_info_pub.publish(self.obstacle2)
      self.uav_info_pub.publish(self.obstacle3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('obstacle_node')
  try:
    ktp = Obstacle()
  except rospy.ROSInterruptException:
    pass