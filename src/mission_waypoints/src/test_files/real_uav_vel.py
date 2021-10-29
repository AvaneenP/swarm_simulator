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

from freyja_msgs.msg import ReferenceState

class RealUAVvel():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.uavFreyja = rospy.get_param(str(rospy.get_name()) + "/freyjaName", "uav")


    self.real_uav = swarm_gps()
    self.real_uav.name = self.uavName
    self.waypoints = swarm_gps()
    self.uav_vel = ReferenceState()
    
    self.uav_vel.pn = 0.0
    self.uav_vel.pe = 0.0
    self.uav_vel.pd = 0.0
    self.uav_vel.vn = 0.0
    self.uav_vel.ve = 0.0
    self.uav_vel.vd = 0.0
    self.uav_vel.yaw = 0.0
    self.uav_vel.an = 0.0
    self.uav_vel.ae = 0.0
    self.uav_vel.ad = 0.0
    self.uav_vel.header.stamp = rospy.Time.now()

    self.coordinate = [0,0,-1]
    
    # Create the publisher and subscriber
    self.position_sub = rospy.Subscriber('/vicon/' + self.uavFreyja + '/' + self.uavFreyja, TransformStamped, self.getDronePos, queue_size = 1)

    self.waypoint_sub = rospy.Subscriber(self.uavName + '/waypoint', swarm_gps, self.getWaypoint, queue_size = 1)

    self.vel_pub = rospy.Publisher('/reference_state', ReferenceState, queue_size = 1)

    self.goal_info_pub = rospy.Publisher(self.uavName + '/goal_info', swarm_gps, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callbacks
  def getDronePos(self, msg):
    self.real_uav.pos.x = msg.transform.translation.x
    self.real_uav.pos.y = msg.transform.translation.y
    self.real_uav.pos.z = msg.transform.translation.z

  def getWaypoint(self, msg):
    self.waypoints = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)


    # While ROS is still running
    while not rospy.is_shutdown():

      self.uav_vel.pn = self.waypoints.pos.x
      self.uav_vel.pe = self.waypoints.pos.y
      self.uav_vel.pd = self.waypoints.pos.z * -1

      x_vel = self.waypoints.pos.x - self.uav_vel.pn
      y_vel = self.waypoints.pos.y - self.uav_vel.pe
      z_vel = (self.waypoints.pos.z + self.uav_vel.pd) * -1

      self.uav_vel.vn = x_vel / 10
      self.uav_vel.ve = y_vel / 10
      self.uav_vel.vd = z_vel / 10

      self.vel_pub.publish(self.uav_vel)

      self.real_uav.vel.x = self.uav_vel.vn
      self.real_uav.vel.y = self.uav_vel.ve
      self.real_uav.vel.z = self.uav_vel.vd

      self.goal_info_pub.publish(self.real_uav)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('real_uav_vel_node')
  try:
    ktp = RealUAVvel()
  except rospy.ROSInterruptException:
    pass