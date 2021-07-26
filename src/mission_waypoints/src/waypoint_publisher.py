#!/usr/bin/env python
import rospy
import copy
import math
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class WaypointReader():
  def __init__(self):
    # Create the publisher and subscriber
    self.velocity_pub1 = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)

    self.velocity_pub2 = rospy.Publisher('/uav2/input/velocity', Vector3, queue_size=1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)

    self.velocity_pub3 = rospy.Publisher('/uav3/input/velocity', Vector3, queue_size=1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)
    
    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    waypoint_file = open('/home/lesslab5/Documents/simulator_ws/src/mission_waypoints/src/mission_waypoints.txt', 'r')

    self.coordinates = []

    for c in waypoint_file:
      c = c[1:len(c)-2]
      temp = c.split(',')
      # print(temp)
      self.coordinates.append(float(temp[0]))
      self.coordinates.append(float(temp[1]))
      self.coordinates.append(float(temp[2]))


    # Create the velocity messages we are going to be sending
    self.goal_vel1 = Vector3()
    self.goal_vel1.x = 0
    self.goal_vel1.y = 0
    self.goal_vel1.z = 0

    self.goal_vel2 = Vector3()
    self.goal_vel2.x = 0
    self.goal_vel2.y = 0
    self.goal_vel2.z = 0

    self.goal_vel3 = Vector3()
    self.goal_vel3.x = 0
    self.goal_vel3.y = 0
    self.goal_vel3.z = 0

    # Call the mainloop of our class
    self.mainloop()
  
  # Callbacks
  def get_pos1(self, msg):
    self.curr_pos1.pose.position.x = msg.pose.position.x
    self.curr_pos1.pose.position.y = msg.pose.position.y
    self.curr_pos1.pose.position.z = msg.pose.position.z

  def get_pos2(self, msg):
    self.curr_pos2.pose.position.x = msg.pose.position.x
    self.curr_pos2.pose.position.y = msg.pose.position.y
    self.curr_pos2.pose.position.z = msg.pose.position.z

  def get_pos3(self, msg):
    self.curr_pos3.pose.position.x = msg.pose.position.x
    self.curr_pos3.pose.position.y = msg.pose.position.y
    self.curr_pos3.pose.position.z = msg.pose.position.z


  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)

    count = 0
    count2 = 0

    # While ROS is still running
    while not rospy.is_shutdown():
      
      self.velocity_pub1.publish(self.goal_vel1)
      self.velocity_pub2.publish(self.goal_vel2)
      self.velocity_pub3.publish(self.goal_vel3)

      if count == len(self.coordinates):
        break

      self.goal_vel1.x = self.coordinates[count] - self.curr_pos1.pose.position.x
      count += 1
      self.goal_vel1.y = self.coordinates[count] - self.curr_pos1.pose.position.y
      count += 1
      self.goal_vel1.z = self.coordinates[count] - self.curr_pos1.pose.position.z
      count += 1

      self.goal_vel2.x = self.coordinates[count] - self.curr_pos2.pose.position.x
      count += 1
      self.goal_vel2.y = self.coordinates[count] - self.curr_pos2.pose.position.y
      count += 1
      self.goal_vel2.z = self.coordinates[count] - self.curr_pos2.pose.position.z
      count += 1

      self.goal_vel3.x = self.coordinates[count] - self.curr_pos3.pose.position.x
      count += 1
      self.goal_vel3.y = self.coordinates[count] - self.curr_pos3.pose.position.y
      count += 1
      self.goal_vel3.z = self.coordinates[count] - self.curr_pos3.pose.position.z
      count += 1

      x_diff1 = pow(self.curr_pos1.pose.position.x - self.waypoint1.x, 2)
      y_diff1 = pow(self.curr_pos1.pose.position.y - self.waypoint1.y, 2)
      z_diff1 = pow(self.curr_pos1.pose.position.z - self.waypoint1.z, 2)
      diff1 = math.sqrt(x_diff1 + y_diff1 + z_diff1)

      x_diff2 = pow(self.curr_pos2.pose.position.x - self.waypoint2.x, 2)
      y_diff2 = pow(self.curr_pos2.pose.position.y - self.waypoint2.y, 2)
      z_diff2 = pow(self.curr_pos2.pose.position.z - self.waypoint2.z, 2)
      diff2 = math.sqrt(x_diff2 + y_diff2 + z_diff2)

      x_diff3 = pow(self.curr_pos3.pose.position.x - self.waypoint3.x, 2)
      y_diff3 = pow(self.curr_pos3.pose.position.y - self.waypoint3.y, 2)
      z_diff3 = pow(self.curr_pos3.pose.position.z - self.waypoint3.z, 2)
      diff3 = math.sqrt(x_diff3 + y_diff3 + z_diff3)

      # and diff1 < 0.3
      if diff2 < 0.5 and diff3 < 0.5 and count != len(self.coordinates):
        # self.waypoint1.x = self.coordinates[count]
        # count += 1
        # self.waypoint1.y = self.coordinates[count]
        # count += 1
        # self.waypoint1.z = self.coordinates[count]
        # count += 1
        self.waypoint2.x = self.coordinates[count]
        count += 1
        self.waypoint2.y = self.coordinates[count]
        count += 1
        self.waypoint2.z = self.coordinates[count]
        count += 1
        self.waypoint3.x = self.coordinates[count]
        count += 1
        self.waypoint3.y = self.coordinates[count]
        count += 1
        self.waypoint3.z = self.coordinates[count]
        count += 1


      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('waypoint_reader_node')
  try:
    ktp = WaypointReader()
  except rospy.ROSInterruptException:
    pass