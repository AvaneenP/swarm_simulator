#!/usr/bin/env python
import rospy
import copy
import math
import time
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
from mission_waypoints.msg import swarm_gps


class WaypointReader():
  def __init__(self):
    
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)
    self.obstacle = rospy.get_param(str(rospy.get_name()) + "/obstacle", False)

    if self.obstacle:
      self.numUAVs -= 1

    self.uav_pos = {}
    self.publisherList = []
    self.waypoint = Vector3()

    # Create the publisher and subscriber
    for i in range(1, self.numUAVs+1):
      self.uav_pos_sub = rospy.Subscriber("uav" + str(i) + "/final_info", swarm_gps, self.uav_pos_info, queue_size = 1)

    for i in range(1, self.numUAVs+1):
      self.publisherList.append( rospy.Publisher("uav" + str(i) + "/waypoint", Vector3, queue_size = 1) )
  
    self.file = rospy.get_param("/waypoint_reader_node/file", "mission_waypoints.txt")

    print("The file used for this run of the simulator is: " + self.file)

    waypoint_file = open('/home/lesslab5/Documents/simulator_ws/src/mission_waypoints/src/waypoint_files/' + self.file, 'r')
    
    self.coordinates = []

    for c in waypoint_file:
      c = c[1:len(c)-2]
      temp = c.split(',')
      self.coordinates.append(float(temp[0]))
      self.coordinates.append(float(temp[1]))
      self.coordinates.append(float(temp[2]))

    # Create the waypoint messages we are going to be sending

    self.acceptance_range = rospy.get_param("/waypoint_reader_node/acceptance_range", 0.25)
    print("The acceptance range is: " + str(self.acceptance_range))

    # Call the mainloop of our class
    self.mainloop()
  
  # Callbacks
  def uav_pos_info(self, msg):
    self.uav_pos[msg.name] = [msg.pos, msg.vel]


  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(1.)

    count = (0 * self.numUAVs)
    count2 = 0
    self.reached = False
    self.counter = time.clock()

    for i in range(len(self.publisherList)):
      self.waypoint.x = self.coordinates[count]
      count += 1
      self.waypoint.y = self.coordinates[count]
      count += 1
      self.waypoint.z = self.coordinates[count]
      count += 1
      self.publisherList[i].publish(self.waypoint)

    # While ROS is still running
    while not rospy.is_shutdown():
      self.time_elapsed = time.clock() - self.counter
      loopCount = 0
      self.reached = False
      
      if count == len(self.coordinates):
        count = count - (3 * self.numUAVs) 

      if count2 == len(self.coordinates):
        count2 = count2 - (3 * self.numUAVs)

      temp = count2

      for key in self.uav_pos.keys():
        loopCount += 1

        x_diff = pow(self.uav_pos[key][0].x - self.coordinates[count2], 2)
        count2 += 1
        y_diff = pow(self.uav_pos[key][0].y - self.coordinates[count2], 2)
        count2 += 1
        z_diff = pow(self.uav_pos[key][0].z - self.coordinates[count2], 2)
        count2 += 1
        diff = math.sqrt(x_diff + y_diff + z_diff)

        if diff > self.acceptance_range:
          count2 = temp
          loopCount = 0
          break

        if loopCount == self.numUAVs:
          self.reached = True

      
      if self.reached:
        self.counter = time.clock()
        print("got to waypoint!")

        for i in range(len(self.publisherList)):
          self.waypoint.x = self.coordinates[count]
          count += 1
          self.waypoint.y = self.coordinates[count]
          count += 1
          self.waypoint.z = self.coordinates[count]
          count += 1
          self.publisherList[i].publish(self.waypoint)
      
      elif self.time_elapsed >= 1:
        print("it's been more than 20 seconds, moving onto next waypoint")
        self.counter = time.clock()
        
        for i in range(len(self.publisherList)):
          self.waypoint.x = self.coordinates[count]
          count += 1
          self.waypoint.y = self.coordinates[count]
          count += 1
          self.waypoint.z = self.coordinates[count]
          count += 1
          self.publisherList[i].publish(self.waypoint)

      else:
        count2 = temp

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('waypoint_reader_node')
  try:
    ktp = WaypointReader()
  except rospy.ROSInterruptException:
    pass