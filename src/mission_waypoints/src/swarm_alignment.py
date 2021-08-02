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
from shapely.geometry import Polygon

class SwarmAlignment():
  def __init__(self):
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.align_v_w = rospy.get_param(str(rospy.get_name()) + "/align_v_w", 0.5)
    print("weight of the 'align' vector is: " + str(self.align_v_w))

    self.align_vel = Vector3()
    self.curr_vel = Vector3()
    self.swarm_loc = swarm_gps()
    self.nearby_uav = String()
    
    # Create the publisher and subscriber
    self.vel_sub = rospy.Subscriber(self.uavName + '/input/velocity', Vector3, self.get_vel, queue_size = 1)

    self.swarm_vel_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_vel, queue_size = 1)

    self.nearby_uav_vel = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_nearby_uav_name, queue_size = 1)

    self.align_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_align_velocity', Vector3, queue_size=1)


    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_vel(self, msg):
    self.curr_vel = copy.deepcopy(msg)

  def get_swarm_vel(self, msg):
    self.swarm_loc = copy.deepcopy(msg)

  def get_nearby_uav_name(self, msg):
    self.nearby_uav = copy.deepcopy(msg)


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():

      if self.swarm_loc.name == self.uavName:
        continue

      if self.swarm_loc.name == self.nearby_uav.data:
        self.align_vel.x = (self.curr_vel.x + self.swarm_loc.vel.x) / 2
        self.align_vel.y = (self.curr_vel.y + self.swarm_loc.vel.y) / 2
        self.align_vel.z = (self.curr_vel.z + self.swarm_loc.vel.z) / 2

        self.align_vel.x = self.align_vel.x * self.align_v_w
        self.align_vel.y = self.align_vel.y * self.align_v_w
        self.align_vel.z = self.align_vel.z * self.align_v_w

        self.align_velocity_pub.publish(self.align_vel)
      else:
        self.align_vel.x = 0
        self.align_vel.y = 0
        self.align_vel.z = 0

        self.align_velocity_pub.publish(self.align_vel)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('alignment_node')
  try:
    ktp = SwarmAlignment()
  except rospy.ROSInterruptException:
    pass