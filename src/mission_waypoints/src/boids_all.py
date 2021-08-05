#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
import matplotlib.pyplot as plt
from matplotlib.pyplot import show, plot
from mission_waypoints.msg import swarm_gps

class Boids():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.goal_vel = Vector3()
    self.pos_vel = Vector3()
    self.away_vel = Vector3()
    self.align_vel = Vector3()
    self.final_vel = Vector3()

    self.curr_pos = PoseStamped()
    self.uav_info = swarm_gps()
    self.uav_info.name = self.uavName

    # Create the publisher and subscriber
    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.final_velocity_pub = rospy.Publisher(self.uavName + '/input/velocity', Vector3, queue_size=1)

    self.goal_velocity_sub = rospy.Subscriber(self.uavName + '/input/unverified_goal_velocity', Vector3, self.get_goal_vec, queue_size=1)

    self.position_velocity_sub = rospy.Subscriber(self.uavName + '/input/unverified_position_velocity', Vector3, self.get_pos_vec, queue_size=1)

    self.away_velocity_sub = rospy.Subscriber(self.uavName + '/input/unverified_away_velocity', Vector3, self.get_away_vec, queue_size=1)

    self.align_velocity_sub = rospy.Subscriber(self.uavName + '/input/unverified_align_velocity', Vector3, self.get_align_vec, queue_size=1)

    self.uav_info_pub = rospy.Publisher(self.uavName + "/final_info", swarm_gps, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z
  
  def get_goal_vec(self, msg):
    self.goal_vel = copy.deepcopy(msg)

  def get_pos_vec(self, msg):
    self.pos_vel = copy.deepcopy(msg)

  def get_away_vec(self, msg):
    self.away_vel = copy.deepcopy(msg)

  def get_align_vec(self, msg):
    self.align_vel = copy.deepcopy(msg)


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.final_vel.x = (self.goal_vel.x + self.pos_vel.x + self.away_vel.x + self.align_vel.x) / 4
      
      self.final_vel.y = (self.goal_vel.y + self.pos_vel.y + self.away_vel.y + self.align_vel.y) / 4
      
      self.final_vel.z = (self.goal_vel.z + self.pos_vel.z + self.away_vel.z + self.align_vel.z) / 4

      self.final_velocity_pub.publish(self.final_vel)

      self.uav_info.pos.x = self.curr_pos.pose.position.x
      self.uav_info.pos.y = self.curr_pos.pose.position.y
      self.uav_info.pos.z = self.curr_pos.pose.position.z

      self.uav_info.vel.x = self.final_vel.x
      self.uav_info.vel.y = self.final_vel.y
      self.uav_info.vel.z = self.final_vel.z

      self.uav_info_pub.publish(self.uav_info)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('boids_vec_node')
  try:
    ktp = Boids()
  except rospy.ROSInterruptException:
    pass