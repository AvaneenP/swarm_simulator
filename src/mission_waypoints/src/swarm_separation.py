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

from matplotlib import pyplot
from shapely.geometry import LineString, Polygon
from shapely.figures import SIZE, set_limits, plot_coords, plot_bounds, plot_line_issimple

class SwarmSeparation():
  def __init__(self):
    
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")

    self.curr_pos = PoseStamped()
    self.swarm_location = swarm_gps()
    self.uav_intersection_name = String()
    self.uav_sphere_name = String()
    self.away_vel = Vector3()

    # Create the publisher and subscriber
    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_position_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.uav_avoid = rospy.Subscriber(self.uavName + "/intersection", String, self.get_avoid_name, queue_size = 1)

    self.uav_sphere_avoid = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_sphere_uav, queue_size = 1)

    self.away_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_away_velocity', Vector3, queue_size=1)

    self.sep_v_w = rospy.get_param(str(rospy.get_name()) + "/sep_v_w", 0.5)
    print("weight of the 'separation' vector is: " + str(self.sep_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
    self.swarm_location = copy.deepcopy(msg)

  def get_avoid_name(self, msg):
    self.uav_intersection_name = copy.deepcopy(msg)

  def get_sphere_uav(self, msg):
    self.uav_sphere_name = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():

      if self.swarm_location.name == self.uavName:
        continue

      if self.swarm_location.name == self.uav_intersection_name.data:
        # print("moving " + self.uavName + " away from " + self.uav_intersection_name.data)
        away_x = (self.curr_pos.pose.position.x - self.swarm_location.pos.x)
        away_y = (self.curr_pos.pose.position.y - self.swarm_location.pos.y)
        away_z = (self.curr_pos.pose.position.z - self.swarm_location.pos.z)

        # if abs(away_x) <= 0.5:
        #   self.away_vel.x = 2 * (away_x/away_x) * self.sep_v_w
        # else:
        #   self.away_vel.x = (1 / away_x) * self.sep_v_w

        # if abs(away_y) <= 0.5:
        #   self.away_vel.y = 2 * (away_y/away_y) * self.sep_v_w
        # else:
        #   self.away_vel.y = (1 / away_y) * self.sep_v_w

        # if abs(away_z) <= 0.5:
        #   self.away_vel.z = 2 * (away_z/away_z) * self.sep_v_w
        # else:
        #   self.away_vel.z = (1 / away_z) * self.sep_v_w

        self.away_vel.x = (0.5 / away_x) * self.sep_v_w
        self.away_vel.y = (0.5 / away_y) * self.sep_v_w
        self.away_vel.z = (0.5 / away_z) * self.sep_v_w
        
        self.away_velocity_pub.publish(self.away_vel)
      else:
        self.away_vel.x = 0
        self.away_vel.y = 0
        self.away_vel.z = 0
        
        self.away_velocity_pub.publish(self.away_vel)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('separation_node')
  try:
    ktp = SwarmSeparation()
  except rospy.ROSInterruptException:
    pass