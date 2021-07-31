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

class PositionCohesion():
  def __init__(self):

    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    
    self.curr_pos = PoseStamped()
    self.swarm_loc = swarm_gps()
    self.pos_vel = Vector3()
    self.nearby_uav = String()

    # Create the publisher and subscriber

    self.position_sub = rospy.Subscriber(self.uavName + '/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_position_sub = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.nearby_uav_position = rospy.Subscriber(self.uavName + "/sphere_of_influence", String, self.get_nearby_uav_name, queue_size = 1)

    self.position_velocity_pub = rospy.Publisher(self.uavName + '/input/unverified_position_velocity', Vector3, queue_size=1)


    self.pos_v_w = rospy.get_param(str(rospy.get_name()) + "/pos_v_w", 0.5)
    print("Weight of the 'position' vector is: " + str(self.pos_v_w))

    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.curr_pos.pose.position.x = msg.pose.position.x
    self.curr_pos.pose.position.y = msg.pose.position.y
    self.curr_pos.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
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

      if self.swarm_loc.name == self.nearby_uav:
        avg_x_pos = (self.curr_pos.pose.position.x + self.swarm_loc.pos.x) / 2
        avg_y_pos = (self.curr_pos.pose.position.y + self.swarm_loc.pos.y) / 2
        avg_z_pos = (self.curr_pos.pose.position.z + self.swarm_loc.pos.z) / 2

        self.pos_vel.x = (avg_x_pos - self.curr_pos.pose.position.x) * self.pos_v_w
        self.pos_vel.y = (avg_y_pos - self.curr_pos.pose.position.y) * self.pos_v_w
        self.pos_vel.z = (avg_z_pos - self.curr_pos.pose.position.z) * self.pos_v_w

        self.position_velocity_pub.publish(self.pos_vel)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('cohesion_node')
  try:
    ktp = PositionCohesion()
  except rospy.ROSInterruptException:
    pass