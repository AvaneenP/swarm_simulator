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
    
    self.swarm_location = swarm_gps()
    self.curr_loc = PoseStamped()
    self.curr_vel = Vector3()
    self.new_vel = Vector3()

    # Create the publisher and subscriber
    self.swarm_loc_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.uav_loc = rospy.Subscriber(self.uavName + "/sensors/gps", PoseStamped, self.get_pos, queue_size = 1)

    self.uav_vel = rospy.Subscriber(self.uavName + "/input/velocity", Vector3, self.get_vel, queue_size = 1)

    self.uav_vel_pub = rospy.Publisher(self.uavName + "/input/velocity", Vector3, queue_size = 1)

    # Call the mainloop of our class
    self.mainloop()

  # Callback for current location
  def get_pos(self, msg):
    self.curr_loc.pose.position.x = msg.pose.position.x
    self.curr_loc.pose.position.y = msg.pose.position.y
    self.curr_loc.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
    self.swarm_location = copy.deepcopy(msg)

  def get_vel(self, msg):
    self.curr_vel = copy.deepcopy(msg)

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():        
      
      if self.swarm_location.name == self.uavName:
        continue

      distance = math.sqrt( pow(self.curr_loc.pose.position.x - self.swarm_location.pos.x, 2) + pow(self.curr_loc.pose.position.y - self.swarm_location.pos.y, 2) + pow(self.curr_loc.pose.position.z - self.swarm_location.pos.z, 2) )

      if distance < 0.5:
        # print(self.uavName + " and " + self.swarm_location.name + " are in each others spheres of influence")
        # check if two drones are on a collision course
        uav1_reachable = Polygon([ (self.curr_loc.pose.position.x, self.curr_loc.pose.position.y), (self.curr_loc.pose.position.x + self.curr_vel.x, self.curr_loc.pose.position.y), (self.curr_loc.pose.position.x, self.curr_loc.pose.position.y + self.curr_vel.y) ])
        
        uav2_reachable = Polygon([ (self.swarm_location.pos.x, self.swarm_location.pos.y), (self.swarm_location.pos.x + self.swarm_location.vel.x, self.swarm_location.pos.y), (self.swarm_location.pos.x, self.swarm_location.pos.y + self.swarm_location.vel.y) ])

        if uav1_reachable.intersects(uav2_reachable):
          # print("collision between " + self.uavName + " and " + self.swarm_location.name)
          self.new_vel.x = -1 * self.curr_vel.x
          self.new_vel.y = -1 * self.curr_vel.y
          self.new_vel.z = -1 * self.curr_vel.z
          self.uav_vel_pub.publish(self.new_vel)

      else:
        continue

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('sphere_of_influence_node')
  try:
    ktp = InfluenceSphere()
  except rospy.ROSInterruptException:
    pass