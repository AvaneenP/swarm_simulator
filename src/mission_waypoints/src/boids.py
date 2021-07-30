#!/usr/bin/env python
import rospy
import copy
import math
import random
from keyboard.msg import Key
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import PoseStamped
import matplotlib.pyplot as plt
from matplotlib.pyplot import show, plot

class BoidsVectors():
  def __init__(self):
    self.goal_vel1 = Vector3()
    self.goal_vel2 = Vector3()
    self.goal_vel3 = Vector3()

    self.pos_vel1 = Vector3()
    self.pos_vel2 = Vector3()
    self.pos_vel3 = Vector3()

    self.away_vel1 = Vector3()
    self.away_vel2 = Vector3()
    self.away_vel3 = Vector3()

    self.align_vel1 = Vector3()
    self.align_vel2 = Vector3()
    self.align_vel3 = Vector3()

    self.final_vel1 = Vector3()
    self.final_vel2 = Vector3()
    self.final_vel3 = Vector3()

    self.uav1_pos = PoseStamped()
    self.uav2_pos = PoseStamped()
    self.uav3_pos = PoseStamped()

    # Create the publisher and subscriber
    self.final_velocity_pub1 = rospy.Publisher('/uav1/input/velocity', Vector3, queue_size=1)
    self.final_velocity_pub2 = rospy.Publisher('/uav2/input/velocity', Vector3, queue_size=1)
    self.final_velocity_pub3 = rospy.Publisher('/uav3/input/velocity', Vector3, queue_size=1)

    self.goal_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_goal_velocity', Vector3, self.get_goal_vec1, queue_size=1)
    self.goal_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_goal_velocity', Vector3, self.get_goal_vec2, queue_size=1)
    self.goal_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_goal_velocity', Vector3, self.get_goal_vec3, queue_size=1)

    self.position_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_position_velocity', Vector3, self.get_pos_vec1, queue_size=1)
    self.position_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_position_velocity', Vector3, self.get_pos_vec2, queue_size=1)
    self.position_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_position_velocity', Vector3, self.get_pos_vec3, queue_size=1)

    self.away_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_away_velocity', Vector3, self.get_away_vec1, queue_size=1)
    self.away_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_away_velocity', Vector3, self.get_away_vec2, queue_size=1)
    self.away_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_away_velocity', Vector3, self.get_away_vec3, queue_size=1)

    self.align_velocity_sub1 = rospy.Subscriber('/uav1/input/unverified_align_velocity', Vector3, self.get_align_vec1, queue_size=1)
    self.align_velocity_sub2 = rospy.Subscriber('/uav2/input/unverified_align_velocity', Vector3, self.get_align_vec2, queue_size=1)
    self.align_velocity_sub3 = rospy.Subscriber('/uav3/input/unverified_align_velocity', Vector3, self.get_align_vec3, queue_size=1)

    self.position_sub1 = rospy.Subscriber('/uav1/sensors/gps', PoseStamped, self.get_pos1, queue_size = 1)
    self.position_sub2 = rospy.Subscriber('/uav2/sensors/gps', PoseStamped, self.get_pos2, queue_size = 1)
    self.position_sub3 = rospy.Subscriber('/uav3/sensors/gps', PoseStamped, self.get_pos3, queue_size = 1)

    self.wayp_pub1 = rospy.Publisher('/uav1/waypoint', Vector3, queue_size=1)
    self.wayp_pub2 = rospy.Publisher('/uav2/waypoint', Vector3, queue_size=1)
    self.wayp_pub3 = rospy.Publisher('/uav3/waypoint', Vector3, queue_size=1)


    # Call the mainloop of our class
    self.mainloop()


  # Callbacks
  def get_goal_vec1(self, msg):
    self.goal_vel1 = copy.deepcopy(msg)

  def get_goal_vec2(self, msg):
    self.goal_vel2 = copy.deepcopy(msg)

  def get_goal_vec3(self, msg):
    self.goal_vel3 = copy.deepcopy(msg)

  def get_pos_vec1(self, msg):
    self.pos_vel1 = copy.deepcopy(msg)

  def get_pos_vec2(self, msg):
    self.pos_vel2 = copy.deepcopy(msg)

  def get_pos_vec3(self, msg):
    self.pos_vel3 = copy.deepcopy(msg)

  def get_away_vec1(self, msg):
    self.away_vel1 = copy.deepcopy(msg)

  def get_away_vec2(self, msg):
    self.away_vel2 = copy.deepcopy(msg)

  def get_away_vec3(self, msg):
    self.away_vel3 = copy.deepcopy(msg)

  def get_align_vec1(self, msg):
    self.align_vel1 = copy.deepcopy(msg)

  def get_align_vec2(self, msg):
    self.align_vel2 = copy.deepcopy(msg)

  def get_align_vec3(self, msg):
    self.align_vel3 = copy.deepcopy(msg)

  def get_pos1(self, msg):
    self.uav1_pos.pose.position.x = msg.pose.position.x
    self.uav1_pos.pose.position.y = msg.pose.position.y
    self.uav1_pos.pose.position.z = msg.pose.position.z

  def get_pos2(self, msg):
    self.uav2_pos.pose.position.x = msg.pose.position.x
    self.uav2_pos.pose.position.y = msg.pose.position.y
    self.uav2_pos.pose.position.z = msg.pose.position.z

  def get_pos3(self, msg):
    self.uav3_pos.pose.position.x = msg.pose.position.x
    self.uav3_pos.pose.position.y = msg.pose.position.y
    self.uav3_pos.pose.position.z = msg.pose.position.z



  # Main Loop
  def mainloop(self):
    # Set the rate of this loop
    rate = rospy.Rate(20)
    rospy.sleep(10.)

    plt.ion()
    fig = plt.figure()
    ax = fig.add_subplot(111)

    # While ROS is still running
    while not rospy.is_shutdown():


      self.final_vel1.x = (self.goal_vel1.x + self.pos_vel1.x + self.away_vel1.x + self.align_vel1.x) / 4
      self.final_vel1.y = (self.goal_vel1.y + self.pos_vel1.y + self.away_vel1.y + self.align_vel1.y) / 4
      self.final_vel1.z = (self.goal_vel1.z + self.pos_vel1.z + self.away_vel1.z + self.align_vel1.z) / 4

      self.final_vel2.x = (self.goal_vel2.x + self.pos_vel2.x + self.away_vel2.x + self.align_vel2.x) / 4
      self.final_vel2.y = (self.goal_vel2.y + self.pos_vel2.y + self.away_vel2.y + self.align_vel2.y) / 4
      self.final_vel2.z = (self.goal_vel2.z + self.pos_vel2.z + self.away_vel2.z + self.align_vel2.z) / 4

      self.final_vel3.x = (self.goal_vel3.x + self.pos_vel3.x + self.away_vel3.x + self.align_vel3.x) / 4
      self.final_vel3.y = (self.goal_vel3.y + self.pos_vel3.y + self.away_vel3.y + self.align_vel3.y) / 4
      self.final_vel3.z = (self.goal_vel3.z + self.pos_vel3.z + self.away_vel3.z + self.align_vel3.z) / 4
      
      self.final_velocity_pub1.publish(self.final_vel1)
      self.final_velocity_pub2.publish(self.final_vel2)
      self.final_velocity_pub3.publish(self.final_vel3)


      # Matplotlib code
      plt.xlim([-10, 10])
      plt.ylim([-10, 10])
      
      plot1 = ax.plot(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, 'ro')
      plot2 = ax.plot(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, 'bo')
      plot3 = ax.plot(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, 'go')

      label1 = ax.text(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, '({}, {})'.format(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y))
      label2 = ax.text(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, '({}, {})'.format(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y))
      label3 = ax.text(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, '({}, {})'.format(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y))

      vec1x = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, self.final_vel1.x, 0, width = 0.1)
      vec1y = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, 0, self.final_vel1.y, width = 0.1)
      
      vec2x = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, self.final_vel2.x, 0, width = 0.1)
      vec2y = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, 0, self.final_vel2.y, width = 0.1)
      
      vec3x = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, self.final_vel3.x, 0, width = 0.1)
      vec3y = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, 0, self.final_vel3.y, width = 0.1)


      reachable_set1 = ax.fill( (self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.x + self.final_vel1.x, self.uav1_pos.pose.position.x), (self.uav1_pos.pose.position.y, self.uav1_pos.pose.position.y, self.uav1_pos.pose.position.y + self.final_vel1.y), "r")      
      
      reachable_set2 = ax.fill( (self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.x + self.final_vel2.x, self.uav2_pos.pose.position.x), (self.uav2_pos.pose.position.y, self.uav2_pos.pose.position.y, self.uav2_pos.pose.position.y + self.final_vel2.y), "b")      
      
      reachable_set3 = ax.fill( (self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.x + self.final_vel3.x, self.uav3_pos.pose.position.x), (self.uav3_pos.pose.position.y, self.uav3_pos.pose.position.y, self.uav3_pos.pose.position.y + self.final_vel3.y), "g")      

      # vec1x = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, self.pos_vel1.x, 0, width = 0.1)
      # vec1y = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, 0, self.pos_vel1.y, width = 0.1)
      
      # vec2x = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, self.pos_vel2.x, 0, width = 0.1)
      # vec2y = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, 0, self.pos_vel2.y, width = 0.1)
      
      # vec3x = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, self.pos_vel3.x, 0, width = 0.1)
      # vec3y = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, 0, self.pos_vel3.y, width = 0.1)


      # vec1x = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, self.goal_vel1.x, 0, width = 0.1)
      # vec1y = ax.arrow(self.uav1_pos.pose.position.x, self.uav1_pos.pose.position.y, 0, self.goal_vel1.y, width = 0.1)
      
      # vec2x = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, self.goal_vel2.x, 0, width = 0.1)
      # vec2y = ax.arrow(self.uav2_pos.pose.position.x, self.uav2_pos.pose.position.y, 0, self.goal_vel2.y, width = 0.1)
      
      # vec3x = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, self.goal_vel3.x, 0, width = 0.1)
      # vec3y = ax.arrow(self.uav3_pos.pose.position.x, self.uav3_pos.pose.position.y, 0, self.goal_vel3.y, width = 0.1)
      

      fig.canvas.draw()
      ax.clear()

      # Sleep for the remainder of the loop
      rate.sleep()

if __name__ == '__main__':
  rospy.init_node('boids_node')
  try:
    ktp = BoidsVectors()
  except rospy.ROSInterruptException:
    pass