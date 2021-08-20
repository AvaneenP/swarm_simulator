#!/usr/bin/env python
import rospy
import time
import copy
import math

from std_msgs.msg import String

from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import TransformStamped
from geometry_msgs.msg import Point

from mission_waypoints.msg import swarm_gps


class SafetyCage():
  def __init__(self):
    
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    
    self.uav_info = swarm_gps()
    self.uav_info.name = self.uavName

    self.curr_pos = PoseStamped()

    self.center_point = Vector3()
    self.center_point.x = 0
    self.center_point.y = 0
    self.center_point.z = 0

    # Create the publisher and subscriber
    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.center_vel_pub = rospy.Publisher(self.uavName + '/input/unverified_center_velocity', Vector3, queue_size=1)

    self.center_info_pub = rospy.Publisher(self.uavName + '/center_info', swarm_gps, queue_size = 1)

    self.curr_loc = PoseStamped()

    self.velocity_waypoints = Vector3()
    self.velocity_waypoints.x = 0
    self.velocity_waypoints.y = 0
    self.velocity_waypoints.z = 0

    # Call the mainloop of our class
    self.mainloop()
  
  # Callback for current location

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.0)

    # While ROS is still running
    while not rospy.is_shutdown():
      

      
      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('safety_cage_node')
  try:
    ktp = SafetyCage()
  except rospy.ROSInterruptException:
    pass