#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

from matplotlib import pyplot
from shapely.geometry import LineString, Polygon
from shapely.figures import SIZE, set_limits, plot_coords, plot_bounds, plot_line_issimple

class CollisionAvoid():
  def __init__(self):
    # Create the publisher and subscriber
    self.gps_loc1_sub = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.gps_loc2_sub = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.gps_loc3_sub = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.velocity_wayp1_sub = rospy.Subscriber('/uav1/input/velocity', Vector3, self.get_wayp1, queue_size = 1)
    self.velocity_wayp2_sub = rospy.Subscriber('/uav2/input/velocity', Vector3, self.get_wayp2, queue_size = 1)
    self.velocity_wayp3_sub = rospy.Subscriber('/uav3/input/velocity', Vector3, self.get_wayp3, queue_size = 1)

    self.influence_sphere = rospy.Subscriber('/uav1/sphere_of_influence/obj_detected', String, self.check_for_obstacle, queue_size = 1)

    self.velocity1_pub = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.velocity2_pub = rospy.Publisher('/uav2/input/velocity', Vector3, queue_size=1)
    self.velocity3_pub = rospy.Publisher('/uav3/input/velocity', Vector3, queue_size=1)

    self.curr_loc1 = PoseStamped()
    self.curr_loc2 = PoseStamped()
    self.curr_loc3 = PoseStamped()

    self.vel_wayp1 = Vector3()
    self.vel_wayp2 = Vector3()
    self.vel_wayp3 = Vector3()

    self.obj_detected = String()

    # Call the mainloop of our class
    self.mainloop()

  # Callback for current location
  def get_pos1(self, msg):
    self.curr_loc1.pose.position.x = msg.pose.position.x
    self.curr_loc1.pose.position.y = msg.pose.position.y
    self.curr_loc1.pose.position.z = msg.pose.position.z

  def get_pos2(self, msg):
    self.curr_loc2.pose.position.x = msg.pose.position.x
    self.curr_loc2.pose.position.y = msg.pose.position.y
    self.curr_loc2.pose.position.z = msg.pose.position.z

  def get_pos3(self, msg):
    self.curr_loc3.pose.position.x = msg.pose.position.x
    self.curr_loc3.pose.position.y = msg.pose.position.y
    self.curr_loc3.pose.position.z = msg.pose.position.z

  def get_wayp1(self, msg):
    self.vel_wayp1 = copy.deepcopy(msg)

  def get_wayp2(self, msg):
    self.vel_wayp2 = copy.deepcopy(msg)

  def get_wayp3(self, msg):
    self.vel_wayp3 = copy.deepcopy(msg)

  def check_for_obstacle(self, msg):
    self.obj_detected.data = msg.data

  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)

    # While ROS is still running
    while not rospy.is_shutdown():        

      if self.obj_detected.data == "uav2":
        # check if uav2 and uav1 are on a collision course
        uav1_pos = LineString([[self.curr_loc1.pose.position.x, self.curr_loc1.pose.position.y, self.curr_loc1.pose.position.z],[self.curr_loc1.pose.position.x + self.vel_wayp1.x, self.curr_loc1.pose.position.y + self.vel_wayp1.y, self.curr_loc1.pose.position.z + self.vel_wayp1.z]])

        uav2_pos = LineString([[self.curr_loc2.pose.position.x, self.curr_loc2.pose.position.y, self.curr_loc2.pose.position.z],[self.curr_loc2.pose.position.x + self.vel_wayp2.x, self.curr_loc2.pose.position.y + self.vel_wayp2.y, self.curr_loc2.pose.position.z + self.vel_wayp2.z]])

        print("uav2 is in sphere; collision:", uav1_pos.intersects(uav2_pos))
        print(uav1_pos.intersection(uav2_pos))

        if uav1_pos.intersects(uav2_pos):
          self.vel_wayp1.x = -1 * self.vel_wayp1.x
          self.vel_wayp1.y = -1 * self.vel_wayp1.y
          self.vel_wayp1.z = -1 * self.vel_wayp1.z
          self.vel_wayp2.x = -1 * self.vel_wayp2.x
          self.vel_wayp2.y = -1 * self.vel_wayp2.y
          self.vel_wayp2.z = -1 * self.vel_wayp2.z
          self.velocity1_pub.publish(self.vel_wayp1)
          self.velocity2_pub.publish(self.vel_wayp2)


      if self.obj_detected.data == "uav3":
        # check if uav3 and uav1 are on a collision course
        uav1_pos = LineString([[self.curr_loc1.pose.position.x, self.curr_loc1.pose.position.y, self.curr_loc1.pose.position.z],[self.curr_loc1.pose.position.x + self.vel_wayp1.x, self.curr_loc1.pose.position.y + self.vel_wayp1.y, self.curr_loc1.pose.position.z + self.vel_wayp1.z]])

        uav3_pos = LineString([[self.curr_loc3.pose.position.x, self.curr_loc3.pose.position.y, self.curr_loc3.pose.position.z],[self.curr_loc3.pose.position.x + self.vel_wayp3.x, self.curr_loc3.pose.position.y + self.vel_wayp3.y, self.curr_loc3.pose.position.z + self.vel_wayp3.z]])

        print("uav3 is in sphere; collision:", uav1_pos.intersects(uav3_pos))
        print(uav1_pos.intersection(uav3_pos))

        if uav1_pos.intersects(uav3_pos):
          self.vel_wayp1.x = -1 * self.vel_wayp1.x
          self.vel_wayp1.y = -1 * self.vel_wayp1.y
          self.vel_wayp1.z = -1 * self.vel_wayp1.z
          self.vel_wayp3.x = -1 * self.vel_wayp2.x
          self.vel_wayp3.y = -1 * self.vel_wayp2.y
          self.vel_wayp3.z = -1 * self.vel_wayp2.z
          self.velocity1_pub.publish(self.vel_wayp1)
          self.velocity3_pub.publish(self.vel_wayp3)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('collision_avoid_node')
  try:
    ktp = CollisionAvoid()
  except rospy.ROSInterruptException:
    pass