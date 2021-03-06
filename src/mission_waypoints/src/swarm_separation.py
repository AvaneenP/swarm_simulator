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


'''
Calculates a uav's "separation" velocity based on other uavs in it's potential intersection sphere --> subscribed to uavName/intersection

Publishes this new "separation" velocity to uavName/input_unverified_away_velocity

Publishes new "separation" velocity and current position to uavName/sep_info
'''

class SwarmSeparation():
  def __init__(self):
    
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)

    self.curr_pos = PoseStamped()
    self.swarm_location = swarm_gps()
    self.uav_intersection_name = String()
    self.away_vel = Vector3()
    self.drone_positions = {}

    self.uav_info = swarm_gps()
    self.uav_info.name = self.uavName

    # Create the publisher and subscriber
    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_position_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.uav_avoid = rospy.Subscriber(self.uavName + "/intersection", String, self.get_avoid_name, queue_size = 1)


    self.away_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_away_velocity', Vector3, queue_size=1)

    self.uav_info_pub = rospy.Publisher(self.uavName + "/sep_info", swarm_gps, queue_size = 1)

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
    self.drone_positions[msg.name] = [msg.pos, msg.vel]

  def get_avoid_name(self, msg):
    self.uav_intersection_name = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    self.avg_away_x = 0
    self.avg_away_y = 0
    self.avg_away_z = 0

    # While ROS is still running
    while not rospy.is_shutdown():  

      if len(self.drone_positions.keys()) != self.numUAVs:
        continue

      if self.uav_intersection_name.data != "":
        for word in self.uav_intersection_name.data.split(","):
          if word == '':
            continue
          vec1 = self.curr_pos.pose.position.x - self.drone_positions[word][0].x
          vec2 = self.curr_pos.pose.position.y - self.drone_positions[word][0].y
          vec3 = self.curr_pos.pose.position.z - self.drone_positions[word][0].z
          mag = math.sqrt( pow(vec1, 2) + pow(vec2, 2) + pow(vec3, 2) )
          vec1 = vec1 / mag
          vec2 = vec2 / mag
          vec3 = vec3 / mag

          self.avg_away_x += vec1 * (3 / mag)
          self.avg_away_y += vec2 * (3 / mag)
          self.avg_away_z += vec3 * (3 / mag)

        self.away_vel.x = self.avg_away_x * self.sep_v_w
        self.away_vel.y = self.avg_away_y * self.sep_v_w
        self.away_vel.z = self.avg_away_z * self.sep_v_w

      self.away_velocity_pub.publish(self.away_vel)

      self.uav_info.pos.x = self.curr_pos.pose.position.x
      self.uav_info.pos.y = self.curr_pos.pose.position.y
      self.uav_info.pos.z = self.curr_pos.pose.position.z

      self.uav_info.vel.x = self.away_vel.x
      self.uav_info.vel.y = self.away_vel.y
      self.uav_info.vel.z = self.away_vel.z

      self.uav_info_pub.publish(self.uav_info)

      self.away_vel.x = 0
      self.away_vel.y = 0
      self.away_vel.z = 0
      self.avg_away_x = 0
      self.avg_away_y = 0
      self.avg_away_z = 0

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('separation_node')
  try:
    ktp = SwarmSeparation()
  except rospy.ROSInterruptException:
    pass