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
    self.numUAVs = rospy.get_param(str(rospy.get_name()) + "/numUAVs", 3)
    self.uavName = rospy.get_param(str(rospy.get_name()) + "/uavName", "uav")
    self.collision_radius = rospy.get_param(str(rospy.get_name()) + "/collision_radius", 0.2)
    print("The collision radius is: " + str(self.collision_radius))
    
    self.uav_gps = PoseStamped()
    self.swarm_gps = swarm_gps()
    self.drone_positions = {}

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
    rospy.sleep(1.)
    self.msg_str = ""

    # While ROS is still running
    while not rospy.is_shutdown():

      self.drone_positions[self.swarm_gps.name] = [self.swarm_gps.pos, self.swarm_gps.vel]      

      if len(self.drone_positions.keys()) != self.numUAVs:
        continue

      for key in sorted(self.drone_positions.keys()):
        if key == self.uavName:
          continue
        distance = math.sqrt( pow(self.uav_gps.pose.position.x - self.drone_positions[key][0].x, 2) + pow(self.uav_gps.pose.position.y - self.drone_positions[key][0].y, 2) + pow(self.uav_gps.pose.position.z - self.drone_positions[key][0].z, 2) )

        if distance <= self.collision_radius:
          self.msg_str = "COLLISION!"
          rospy.logerr("COLLISION!")
          self.collision_pub.publish(self.msg_str)

        self.collision_pub.publish(self.msg_str)
        self.msg_str = ""

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('collision_node')
  try:
    ktp = CollisionDetector()
  except rospy.ROSInterruptException:
    pass