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
Checks if a uav's location is within the same "sphere" as some other uavs
If so, publishes the names of those uavs to /uavName/intersection
Used for separation behavior 
'''

class ReachableSet():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)

    self.collisionSphere = rospy.get_param(str(rospy.get_name()) + "/separationRadius", 2.5)
    print("The sphere for separation is: " + str(self.collisionSphere))
    
    self.curr_loc = PoseStamped()
    self.curr_vel = Vector3()
    self.uav_collision_name = String()
    self.drone_positions = {}

    self.uav_collision_name = ""

    # Create the publisher and subscriber
    self.swarm_loc_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.uav_loc = rospy.Subscriber(self.uavName + "/sensors/gps", PoseStamped, self.get_pos, queue_size = 1)

    self.uav_vel = rospy.Subscriber(self.uavName + "/input/velocity", Vector3, self.get_vel, queue_size = 1)

    self.uav_intersection = rospy.Publisher(self.uavName + "/intersection", String, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callback for current location
  def get_pos(self, msg):
    self.curr_loc.pose.position.x = msg.pose.position.x
    self.curr_loc.pose.position.y = msg.pose.position.y
    self.curr_loc.pose.position.z = msg.pose.position.z

  def get_vel(self, msg):
    self.curr_vel = copy.deepcopy(msg)

  def get_swarm_pos(self, msg):
    self.drone_positions[msg.name] = [msg.pos, msg.vel]


  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    # While ROS is still running
    while not rospy.is_shutdown():         

      if len(self.drone_positions.keys()) != self.numUAVs:
        continue

      for key in sorted(self.drone_positions.keys()):
        if key == self.uavName:
          continue
        self.distance = math.sqrt( pow(self.curr_loc.pose.position.x - self.drone_positions[key][0].x, 2) + pow(self.curr_loc.pose.position.y - self.drone_positions[key][0].y, 2) + pow(self.curr_loc.pose.position.z - self.drone_positions[key][0].z, 2) )

        if self.distance <= self.collisionSphere:
          self.uav_collision_name = self.uav_collision_name + key + ","

      self.uav_collision_name = self.uav_collision_name.rstrip(",")
      self.uav_intersection.publish(self.uav_collision_name)
      self.uav_collision_name = ""

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('reachable_set_node')
  try:
    ktp = ReachableSet()
  except rospy.ROSInterruptException:
    pass