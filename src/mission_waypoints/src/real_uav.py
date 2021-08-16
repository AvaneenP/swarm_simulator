#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import TransformStamped
from mission_waypoints.msg import swarm_gps

class RealUAV():
  def __init__(self):
    
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.real_uav = swarm_gps()
    self.real_uav.name = self.uavName

    # Create the publisher and subscriber
    self.real_uav_sub = rospy.Subscriber('/vicon/' + self.uavName + '/' + self.uavName, TransformStamped, self.getDronePos, queue_size = 1)

    self.uav_info_pub = rospy.Publisher('/swarm/gps', swarm_gps, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callbacks
  def getDronePos(self, msg):
    scaling = 3
    self.real_uav.pos.x = msg.transform.translation.x * scaling
    self.real_uav.pos.y = msg.transform.translation.y * scaling
    self.real_uav.pos.z = 1.5


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.uav_info_pub.publish(self.real_uav)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('real_uav_node')
  try:
    ktp = RealUAV()
  except rospy.ROSInterruptException:
    pass