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


class InfluenceSphere():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.influence_radius = rospy.get_param(str(rospy.get_name()) + "/influence_radius", 1)
    print("The influence radius is: " + str(self.influence_radius))
    
    self.swarm_location = swarm_gps()
    self.curr_loc = PoseStamped()
    self.drone_positions = {}
    self.intersec_uav = String()

    self.intersec_uav = ""

    # Create the publisher and subscriber
    self.swarm_loc_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.uav_loc = rospy.Subscriber(self.uavName + "/sensors/gps", PoseStamped, self.get_pos, queue_size = 1)

    self.uav_sphere = rospy.Publisher(self.uavName + "/sphere_of_influence", String, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callback for current location
  def get_pos(self, msg):
    self.curr_loc.pose.position.x = msg.pose.position.x
    self.curr_loc.pose.position.y = msg.pose.position.y
    self.curr_loc.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
    self.swarm_location = copy.deepcopy(msg)


  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():        
      
      self.drone_positions[self.swarm_location.name] = [self.swarm_location.pos, self.swarm_location.vel]

      if len(self.drone_positions.keys()) != 3:
        continue

      for key in sorted(self.drone_positions.keys()):
        if key == self.uavName:
          continue
        self.distance = math.sqrt( pow(self.curr_loc.pose.position.x - self.drone_positions[key][0].x, 2) + pow(self.curr_loc.pose.position.y - self.drone_positions[key][0].y, 2) )

        if self.distance <= self.influence_radius:
          self.intersec_uav = self.intersec_uav + key + ","

      self.intersec_uav = self.intersec_uav.rstrip(",")
      self.uav_sphere.publish(self.intersec_uav)
      self.intersec_uav = ""

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('sphere_of_influence_node')
  try:
    ktp = InfluenceSphere()
  except rospy.ROSInterruptException:
    pass