#!/usr/bin/env python
import rospy
import copy
import math
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class WaypointReader():
  def __init__(self):

    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    # Create the publisher and subscriber
    self.wayp_pub1 = rospy.Publisher('/uav1/waypoint', Vector3, queue_size=1)
    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)

    self.wayp_pub2 = rospy.Publisher('/uav2/waypoint', Vector3, queue_size=1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)

    self.wayp_pub3 = rospy.Publisher('/uav3/waypoint', Vector3, queue_size=1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)
  

    waypoint_file = open('/home/lesslab5/Documents/simulator_ws/src/mission_waypoints/src/mission_waypoints.txt', 'r')
    
    # waypoint_file = open('/home/avaneenpinninti/Documents/swarm_simulator/src/mission_waypoints/src/mission_waypoints.txt', 'r')

    self.coordinates = []

    for c in waypoint_file:
      c = c[1:len(c)-2]
      temp = c.split(',')
      # print(temp)
      self.coordinates.append(float(temp[0]))
      self.coordinates.append(float(temp[1]))
      self.coordinates.append(float(temp[2]))

    # Create the waypoint messages we are going to be sending
    self.goal_wayp1 = Vector3()
    self.goal_wayp2 = Vector3()
    self.goal_wayp3 = Vector3()

    self.acceptance_range = rospy.get_param("/waypoint_reader_node/acceptance_range", 0.1)
    print("the acceptance range is: " + str(self.acceptance_range))

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
    rospy.sleep(10.)

    count = 9
    count2 = 0

    # While ROS is still running
    while not rospy.is_shutdown():
      
      if count == len(self.coordinates):
        count = count - 9 

      if count2 == len(self.coordinates):
        count2 = count2 - 9 
      
      x_diff1 = pow(self.curr_pos1.pose.position.x - self.coordinates[count2], 2)
      count2 += 1
      y_diff1 = pow(self.curr_pos1.pose.position.y - self.coordinates[count2], 2)
      count2 += 1
      z_diff1 = pow(self.curr_pos1.pose.position.z - self.coordinates[count2], 2)
      count2 += 1
      diff1 = math.sqrt(x_diff1 + y_diff1 + z_diff1)

      x_diff2 = pow(self.curr_pos2.pose.position.x - self.coordinates[count2], 2)
      count2 += 1
      y_diff2 = pow(self.curr_pos2.pose.position.y - self.coordinates[count2], 2)
      count2 += 1
      z_diff2 = pow(self.curr_pos2.pose.position.z - self.coordinates[count2], 2)
      count2 += 1
      diff2 = math.sqrt(x_diff2 + y_diff2 + z_diff2)

      x_diff3 = pow(self.curr_pos3.pose.position.x - self.coordinates[count2], 2)
      count2 += 1
      y_diff3 = pow(self.curr_pos3.pose.position.y - self.coordinates[count2], 2)
      count2 += 1
      z_diff3 = pow(self.curr_pos3.pose.position.z - self.coordinates[count2], 2)
      count2 += 1
      diff3 = math.sqrt(x_diff3 + y_diff3 + z_diff3)
      

      if diff1 < self.acceptance_range and diff2 < self.acceptance_range and diff3 < self.acceptance_range:
        print("got to waypoint!")
        
        self.goal_wayp1.x = self.coordinates[count]
        count += 1
        self.goal_wayp1.y = self.coordinates[count]
        count += 1
        self.goal_wayp1.z = self.coordinates[count]
        count += 1
        
        self.goal_wayp2.x = self.coordinates[count]
        count += 1
        self.goal_wayp2.y = self.coordinates[count]
        count += 1
        self.goal_wayp2.z = self.coordinates[count]
        count += 1
        
        self.goal_wayp3.x = self.coordinates[count]
        count += 1
        self.goal_wayp3.y = self.coordinates[count]
        count += 1
        self.goal_wayp3.z = self.coordinates[count]
        count += 1

        self.wayp_pub1.publish(self.goal_wayp1)
        self.wayp_pub2.publish(self.goal_wayp2)
        self.wayp_pub3.publish(self.goal_wayp3)
      else:
        count2 = count2 - 9

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('waypoint_reader_node')
  try:
    ktp = WaypointReader()
  except rospy.ROSInterruptException:
    pass