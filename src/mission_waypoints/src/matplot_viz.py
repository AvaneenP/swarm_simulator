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

    self.final_arrows = rospy.get_param("matplot_viz_node/final_arrows", False)
    self.goal_arrows = rospy.get_param("matplot_viz_node/goal_arrows", False)
    self.pos_arrows = rospy.get_param("matplot_viz_node/pos_arrows", False)
    self.sep_arrows = rospy.get_param("matplot_viz_node/sep_arrows", False)
    self.align_arrows = rospy.get_param("matplot_viz_node/align_arrows", False)

    self.numUAVs = rospy.get_param("matplot_viz_node/numUAVs", 3)


    # Create the publisher and subscriber
    for i in range(1, self.numUAVs+1):
      self.uav_goal_info_sub = rospy.Subscriber("uav" + str(i) + "/goal_info", swarm_gps, self.uav_goal_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_align_info_sub = rospy.Subscriber("uav" + str(i) + "/align_info", swarm_gps, self.uav_align_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_pos_info_sub = rospy.Subscriber("uav" + str(i) + "/pos_info", swarm_gps, self.uav_pos_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_sep_info_sub = rospy.Subscriber("uav" + str(i) + "/sep_info", swarm_gps, self.uav_sep_plot, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.uav_final_info_sub = rospy.Subscriber("uav" + str(i) + "/final_info", swarm_gps, self.uav_final_plot, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def uav_goal_plot(self, msg):
    self.swarm_goalInfo[msg.name] = [msg.pos, msg.vel]

  def uav_align_plot(self, msg):
    self.swarm_alignInfo[msg.name] = [msg.pos, msg.vel]

  def uav_pos_plot(self, msg):
    self.swarm_posInfo[msg.name] = [msg.pos, msg.vel]

  def uav_sep_plot(self, msg):
    self.swarm_sepInfo[msg.name] = [msg.pos, msg.vel]

  def uav_final_plot(self, msg):
    self.swarm_finalInfo[msg.name] = [msg.pos, msg.vel]

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    plt.ion()
    self.fig = plt.figure()
    self.ax = self.fig.add_subplot(111)

    # While ROS is still running
    while not rospy.is_shutdown():

      plt.xlim([-10, 10])
      plt.ylim([-10, 10])

      for key in self.swarm_goalInfo.keys():
        if self.goal_arrows:
          point = self.ax.plot(self.swarm_goalInfo[key][0].x, self.swarm_goalInfo[key][0].y, 'ko')
          arrow = self.ax.arrow(self.swarm_goalInfo[key][0].x, self.swarm_goalInfo[key][0].y, self.swarm_goalInfo[key][1].x, self.swarm_goalInfo[key][1].y, width = 0.1)

      for key in self.swarm_alignInfo.keys():
        if self.align_arrows:
          arrow = self.ax.arrow(self.swarm_alignInfo[key][0].x, self.swarm_alignInfo[key][0].y, self.swarm_alignInfo[key][1].x, self.swarm_alignInfo[key][1].y, color = "g", width = 0.1, alpha = 0.5)

      for key in self.swarm_posInfo.keys():
        if self.pos_arrows:
          arrow = self.ax.arrow(self.swarm_posInfo[key][0].x, self.swarm_posInfo[key][0].y, self.swarm_posInfo[key][1].x, self.swarm_posInfo[key][1].y, color = "b", width = 0.1, alpha = 0.5)

      for key in self.swarm_sepInfo.keys():
        if self.sep_arrows:
          arrow = self.ax.arrow(self.swarm_sepInfo[key][0].x, self.swarm_sepInfo[key][0].y, self.swarm_sepInfo[key][1].x, self.swarm_sepInfo[key][1].y, color = "r", width = 0.1, alpha = 0.5)

      for key in self.swarm_finalInfo.keys():
        if self.final_arrows:
          arrow = self.ax.arrow(self.swarm_finalInfo[key][0].x, self.swarm_finalInfo[key][0].y, self.swarm_finalInfo[key][1].x, self.swarm_finalInfo[key][1].y, color = "y", width = 0.1, alpha = 0.5)

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