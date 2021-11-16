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
from freyja_msgs.msg import ReferenceState


"""
Flamewheel will fly in a rectangle around the cage
"""

class TestRealUAV():
  def __init__(self):
    
    self.coordinates = {}
    self.coordinates[1] = [0,0,0]
    self.coordinates[2] = [0,0,1]
    self.coordinates[3] = [-1.5,0,1]
    self.coordinates[4] = [-1.5,-1.5,1]
    self.coordinates[5] = [1.5,-1.5,1]
    self.coordinates[6] = [1.5,0,1]
    self.coordinates[7] = [0,0,1]
    
    self.uavPos = swarm_gps()
    self.uavInfo = ReferenceState()
    self.key = 1


    # Create the publisher and subscriber
    self.real_uav_sub = rospy.Subscriber('/vicon/JADE/JADE', TransformStamped, self.getDronePos, queue_size = 1)

    self.real_uav_pub = rospy.Publisher('/reference_state', ReferenceState, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callbacks
  def getDronePos(self, msg):
    self.uavPos.pos.x = msg.transform.translation.x
    self.uavPos.pos.y = msg.transform.translation.y
    self.uavPos.pos.z = msg.transform.translation.z

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():

      x_diff = pow(self.coordinates[self.key][0] - self.uavPos.pos.x, 2)
      y_diff = pow(self.coordinates[self.key][1] - self.uavPos.pos.y, 2)
      z_diff = pow(self.coordinates[self.key][2] - self.uavPos.pos.z, 2)
      diff = math.sqrt(x_diff + y_diff + z_diff)

      if diff < 0.5:
          print("got to waypoint!")
          self.key += 1
          if self.key > 7:
              self.key = 7
          self.uavInfo.pn = self.coordinates[self.key][0]
          self.uavInfo.pe = self.coordinates[self.key][1]
          self.uavinfo.pd = self.coordinates[self.key][2] * -1

        #   self.uavInfo.vn = (self.coordinates[self.key][0] - self.uavPos.pos.x) / 5
        #   self.uavInfo.ve = (self.coordinates[self.key][1] - self.uavPos.pos.y) / 5
        #   self.uavInfo.vd = ((self.coordinates[self.key][2] - self.uavPos.pos.z) * -1) / 5
      else:
          self.uavInfo.pn = self.coordinates[self.key][0]
          self.uavInfo.pe = self.coordinates[self.key][1]
          self.uavinfo.pd = self.coordinates[self.key][2] * -1

        #   self.uavInfo.vn = (self.coordinates[self.key][0] - self.uavPos.pos.x) / 5
        #   self.uavInfo.ve = (self.coordinates[self.key][1] - self.uavPos.pos.y) / 5
        #   self.uavInfo.vd = ((self.coordinates[self.key][2] - self.uavPos.pos.z) * -1) / 5

      self.real_uav_pub.publish(self.uavInfo)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('test_real_uav_node')
  try:
    ktp = TestRealUAV()
  except rospy.ROSInterruptException:
    pass