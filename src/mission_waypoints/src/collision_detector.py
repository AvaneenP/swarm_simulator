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

class CollisionDetector():
  def __init__(self):
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.collision_radius = rospy.get_param(str(rospy.get_name()) + "/collision_radius", 0.1)
    print("The collision radius is: " + str(self.collision_radius))
    
    self.uav_gps = PoseStamped()
    self.swarm_gps = swarm_gps()

    self.uav_pos = rospy.Subscriber(self.uavName + "/sensors/gps", PoseStamped, self.get_pos, queue_size = 1)

    self.swarm_pos = rospy.Subscriber('/swarm/gps', swarm_gps, self.get_swarm_pos, queue_size = 1)

    self.collision_pub = rospy.Publisher('/swarm/collision', String, queue_size = 1)

    # Call the mainloop of our classt
    self.mainloop()


  # Callbacks
  def get_pos(self, msg):
    self.uav_gps.pose.position.x = msg.pose.position.x
    self.uav_gps.pose.position.y = msg.pose.position.y
    self.uav_gps.pose.position.z = msg.pose.position.z

  def get_swarm_pos(self, msg):
    self.swarm_gps = copy.deepcopy(msg)

  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    # While ROS is still running
    while not rospy.is_shutdown():

      if self.swarm_gps.name == self.uavName:
        continue

      distance = math.sqrt( pow(self.uav_gps.pose.position.x - self.swarm_gps.pos.x, 2) + pow(self.uav_gps.pose.position.y - self.swarm_gps.pos.y, 2) + pow(self.uav_gps.pose.position.z - self.swarm_gps.pos.z, 2) )

      if distance <= self.collision_radius:
        msg_str = str(self.uavName) + " and "
        msg_str = msg_str + str(self.swarm_gps.name)
        msg_str = msg_str + " collided!"
        self.collision_pub.publish(msg_str)

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('collision_node')
  try:
    ktp = CollisionDetector()
  except rospy.ROSInterruptException:
    pass