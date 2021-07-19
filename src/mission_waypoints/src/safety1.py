#!/usr/bin/env python
import rospy
import copy
import math
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class SafetyCage():
  def __init__(self):
    # Create the publisher and subscriber
    self.gps_loc_sub = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos, queue_size = 1)
    self.vel_waypoint_sub = rospy.Subscriber('/uav1/input/unverified_velocity', Vector3, self.get_setPoint, queue_size = 1)

    self.velocity_pub = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.velocity_unver_pub = rospy.Publisher('/uav1/input/unverified_velocity', Vector3, queue_size = 1)

    self.velocity_waypoints_unverified = Vector3()

    self.curr_loc = PoseStamped()

    self.velocity_waypoints = Vector3()
    self.velocity_waypoints.x = 0
    self.velocity_waypoints.y = 0
    self.velocity_waypoints.z = 0

    # Call the mainloop of our class
    self.mainloop()
  
  # Callback for current location
  def get_pos(self, msg):
    self.curr_loc.pose.position.x = msg.pose.position.x
    self.curr_loc.pose.position.y = msg.pose.position.y
    self.curr_loc.pose.position.z = msg.pose.position.z

  def get_setPoint(self, msg):
    self.velocity_waypoints_unverified = copy.deepcopy(msg)

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)

    # While ROS is still running
    while not rospy.is_shutdown():
      
      if self.curr_loc.pose.position.x < 10 and self.curr_loc.pose.position.x > -10 and self.curr_loc.pose.position.y < 10 and self.curr_loc.pose.position.y > -10 and self.curr_loc.pose.position.z < 10 and self.curr_loc.pose.position.z >= 0:
        self.velocity_waypoints = self.velocity_waypoints_unverified
        self.velocity_pub.publish(self.velocity_waypoints)
      else:
        # self.velocity_waypoints.x = -1 * self.velocity_waypoints.x
        # self.velocity_waypoints.y = -1 * self.velocity_waypoints.y
        # self.velocity_waypoints.z = -1 * self.velocity_waypoints.z
        self.velocity_waypoints.x = 0
        self.velocity_waypoints.y = 0
        self.velocity_waypoints.z = 0
        self.velocity_pub.publish(self.velocity_waypoints)
        # rospy.sleep(5.)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('safety_cage_node')
  try:
    ktp = SafetyCage()
  except rospy.ROSInterruptException:
    pass