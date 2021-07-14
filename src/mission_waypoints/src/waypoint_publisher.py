#!/usr/bin/env python
import rospy
import copy
import math
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped

class WaypointReader():
  def __init__(self):
    # Create the publisher and subscriber
    self.position_pub1 = rospy.Publisher('/uav1/input/position', Vector3, queue_size=1)
    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)

    self.position_pub2 = rospy.Publisher('/uav2/input/position', Vector3, queue_size=1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)

    self.position_pub3 = rospy.Publisher('/uav3/input/position', Vector3, queue_size=1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)
    
    self.curr_pos1 = PoseStamped()
    self.curr_pos2 = PoseStamped()
    self.curr_pos3 = PoseStamped()

    self.waypoint_file = open('/home/lesslab5/Documents/simulator_ws/src/mission_waypoints/src/mission_waypoints.txt', 'r')

    # Create the position messages we are going to be sending
    self.waypoint1 = Vector3()
    self.waypoint1.x = 0
    self.waypoint1.y = 0
    self.waypoint1.z = 3
    self.waypoint2 = Vector3()
    self.waypoint2.x = 0
    self.waypoint2.y = 0
    self.waypoint2.z = 3
    self.waypoint3 = Vector3()
    self.waypoint3.x = 0
    self.waypoint3.y = 0
    self.waypoint3.z = 3

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

    self.position_pub1.publish(self.waypoint1)
    self.position_pub2.publish(self.waypoint2)
    self.position_pub3.publish(self.waypoint3)


    # While ROS is still running
    while not rospy.is_shutdown():
      for c in self.waypoint_file:
        c = c[1:len(c)-2]
        if c=="/":
          continue
        coordinates = c.split(',')
        
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

        if diff1 < 0.3 and diff2 < 0.3 and diff3 < 0.3:
          self.waypoint1.x = coordinates[0]
          self.waypoint1.y = coordinates[1]
          self.waypoint1.z = coordinates[2]
          self.waypoint2.x = coordinates[3]
          self.waypoint2.y = coordinates[4]
          self.waypoint2.z = coordinates[5]
          self.waypoint3.x = coordinates[6]
          self.waypoint3.y = coordinates[7]
          self.waypoint3.z = coordinates[8]
        
        self.position_pub1.publish(self.waypoint1)
        self.position_pub2.publish(self.waypoint2)
        self.position_pub3.publish(self.waypoint3)

      # Sleep for the remainder of the loop
      rate.sleep()



if __name__ == '__main__':
  rospy.init_node('waypoint_reader_node')
  try:
    ktp = WaypointReader()
  except rospy.ROSInterruptException:
    pass