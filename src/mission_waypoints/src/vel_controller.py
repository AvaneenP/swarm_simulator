#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from mission_waypoints.msg import swarm_gps

class VelocityPublisher():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.vel = Vector3()
    self.curr_pos = PoseStamped()
    self.wayp = swarm_gps()
    self.uav_info = swarm_gps()

    self.uav_info.name = self.uavName

    # Create the publisher and subscriber
    self.uav_wayp = rospy.Subscriber(self.uavName + '/waypoint', swarm_gps, self.get_wayp, queue_size = 1)

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_goal_velocity', Vector3, queue_size=1)

    self.uav_info_pub = rospy.Publisher(self.uavName + '/goal_info', swarm_gps, queue_size = 1)


    self.goal_v_w = rospy.get_param(str(rospy.get_name()) + "/goal_v_w", 0.5)
    print("weight of the 'goal' vector is: " + str(self.goal_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_wayp(self, msg):
    self.wayp = copy.deepcopy(msg)

  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z


  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():

      self.vel.x = (self.wayp.pos.x - self.curr_pos.pose.position.x) * self.goal_v_w
      self.vel.y = (self.wayp.pos.y - self.curr_pos.pose.position.y) * self.goal_v_w
      self.vel.z = (self.wayp.pos.z - self.curr_pos.pose.position.z) * self.goal_v_w

      self.velocity_pub.publish(self.vel)

      self.uav_info.pos.x = self.curr_pos.pose.position.x
      self.uav_info.pos.y = self.curr_pos.pose.position.y
      self.uav_info.pos.z = self.curr_pos.pose.position.z

      self.uav_info.vel.x = self.vel.x
      self.uav_info.vel.y = self.vel.y
      self.uav_info.vel.z = self.vel.z

      self.uav_info_pub.publish(self.uav_info)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('velocity_pub_node')
  try:
    ktp = VelocityPublisher()
  except rospy.ROSInterruptException:
    pass