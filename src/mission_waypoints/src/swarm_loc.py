#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from mission_waypoints.msg import swarm_gps

class SwarmGPS():
  def __init__(self):
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    # self.uavName = "uav1"
    
    self.gps_pos = PoseStamped()
    self.velocity = Vector3()
    self.uav_gps = swarm_gps()

    self.uav_pos = rospy.Subscriber(self.uavName + "/sensors/gps", PoseStamped, self.get_pos, queue_size = 1)

    self.uav_vel = rospy.Subscriber(self.uavName + "/input/velocity", Vector3, self.get_vel, queue_size = 1)

    self.swarm_pos = rospy.Publisher('/swarm/gps', swarm_gps, queue_size = 1)

    # Call the mainloop of our classt
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.gps_pos.pose.position.x = msg.pose.position.x
    self.gps_pos.pose.position.y = msg.pose.position.y
    self.gps_pos.pose.position.z = msg.pose.position.z

  def get_vel(self, msg):
    self.velocity = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():
      
      self.uav_gps.name = self.uavName
      self.uav_gps.pos.x = self.gps_pos.pose.position.x
      self.uav_gps.pos.y = self.gps_pos.pose.position.y
      self.uav_gps.pos.z = self.gps_pos.pose.position.z
      self.uav_gps.vel.x = self.velocity.x
      self.uav_gps.vel.y = self.velocity.y
      self.uav_gps.vel.z = self.velocity.z

      self.swarm_pos.publish(self.uav_gps)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('swarm_gps_node')
  try:
    ktp = SwarmGPS()
  except rospy.ROSInterruptException:
    pass