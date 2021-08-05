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


class MatplotViz():
  def __init__(self):
    self.swarm_goalInfo = {}
    self.swarm_alignInfo = {}
    self.swarm_posInfo = {}
    self.swarm_sepInfo = {}
    self.swarm_finalInfo = {}
    self.swarm_pos = {}

    self.final_arrows = rospy.get_param(str(rospy.get_name()) + "/final_arrows", False)
    self.goal_arrows = rospy.get_param(str(rospy.get_name()) + "/goal_arrows", False)
    self.pos_arrows = rospy.get_param(str(rospy.get_name()) + "/pos_arrows", False)
    self.sep_arrows = rospy.get_param(str(rospy.get_name()) + "/sep_arrows", False)
    self.align_arrows = rospy.get_param(str(rospy.get_name()) + "/align_arrows", False)

    self.view_type = rospy.get_param(str(rospy.get_name()) + "/view", "xy")

    self.a = 0
    if self.view_type == "xy":
      self.a = 1
    elif self.view_type == "xz":
      self.a = 2
    else:
      rospy.logerr("Error, view type incorrect")
      exit()

    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)

    # Create the publisher and subscriber
    for i in range(1, self.numUAVs+1):
      print("Subscribing to: uav{}/goal_info".format(i))
      self.uav_goal_info_sub = rospy.Subscriber("uav" + str(i) + "/goal_info", swarm_gps, self.uav_goal_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_align_info_sub = rospy.Subscriber("uav" + str(i) + "/align_info", swarm_gps, self.uav_align_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_pos_info_sub = rospy.Subscriber("uav" + str(i) + "/pos_info", swarm_gps, self.uav_pos_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_sep_info_sub = rospy.Subscriber("uav" + str(i) + "/sep_info", swarm_gps, self.uav_sep_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_final_info_sub = rospy.Subscriber("uav" + str(i) + "/final_info", swarm_gps, self.uav_final_plot, queue_size = 1)

    self.swarm_pos_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callbacks
  def uav_goal_plot(self, msg):
    self.swarm_goalInfo[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                                     [msg.vel.x, msg.vel.y, msg.vel.z]]

  def uav_align_plot(self, msg):
    self.swarm_alignInfo[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                                     [msg.vel.x, msg.vel.y, msg.vel.z]]

  def uav_pos_plot(self, msg):
    self.swarm_posInfo[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                                     [msg.vel.x, msg.vel.y, msg.vel.z]]

  def uav_sep_plot(self, msg):
    self.swarm_sepInfo[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                                     [msg.vel.x, msg.vel.y, msg.vel.z]]

  def uav_final_plot(self, msg):
    self.swarm_finalInfo[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                                     [msg.vel.x, msg.vel.y, msg.vel.z]]

  def get_swarm_pos(self, msg):
    self.swarm_pos[msg.name] = [[msg.pos.x, msg.pos.y, msg.pos.z],
                               [msg.vel.x, msg.vel.y, msg.vel.z]]

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(0.1)

    plt.ion()
    self.fig = plt.figure(figsize=(13,13))
    self.ax = self.fig.add_subplot(111)

    # While ROS is still running
    while not rospy.is_shutdown():

      plt.title("Viewing {} axis".format(self.view_type))
      plt.xlim([-10, 10])
      plt.ylim([-10, 10])

      for key in self.swarm_goalInfo.keys():
        if self.goal_arrows:
          point = self.ax.plot(self.swarm_goalInfo[key][0][0], self.swarm_goalInfo[key][0][self.a], 'ko')
          arrow = self.ax.arrow(self.swarm_goalInfo[key][0][0], self.swarm_goalInfo[key][0][self.a], self.swarm_goalInfo[key][1][0], self.swarm_goalInfo[key][1][self.a], width = 0.1, color = "m")

      for key in self.swarm_alignInfo.keys():
        if self.align_arrows:
          arrow = self.ax.arrow(self.swarm_alignInfo[key][0][0], self.swarm_alignInfo[key][0][self.a], self.swarm_alignInfo[key][1][0], self.swarm_alignInfo[key][1][self.a], color = "g", width = 0.1, alpha = 0.5)

      for key in self.swarm_posInfo.keys():
        if self.pos_arrows:
          arrow = self.ax.arrow(self.swarm_posInfo[key][0][0], self.swarm_posInfo[key][0][self.a], self.swarm_posInfo[key][1][0], self.swarm_posInfo[key][1][self.a], color = "b", width = 0.1, alpha = 0.5)

      for key in self.swarm_sepInfo.keys():
        if self.sep_arrows:
          arrow = self.ax.arrow(self.swarm_sepInfo[key][0][0], self.swarm_sepInfo[key][0][self.a], self.swarm_sepInfo[key][1][0], self.swarm_sepInfo[key][1][self.a], color = "r", width = 0.1, alpha = 0.5)

      for key in self.swarm_finalInfo.keys():
        if self.final_arrows:
          arrow = self.ax.arrow(self.swarm_finalInfo[key][0][0], self.swarm_finalInfo[key][0][self.a], self.swarm_finalInfo[key][1][0], self.swarm_finalInfo[key][1][self.a], color = "y", width = 0.1, alpha = 0.5)

      for key in self.swarm_pos.keys():
        point = self.ax.plot(self.swarm_pos[key][0][0], self.swarm_pos[key][0][self.a], 'ko')

      self.fig.canvas.draw()
      self.ax.clear()

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('matplot_viz_node')
  try:
    ktp = MatplotViz()
  except rospy.ROSInterruptException:
    pass