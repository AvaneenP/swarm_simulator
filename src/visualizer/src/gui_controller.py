#!/usr/bin/env python
import rospy
import numpy as np

from gui import GUI
from geometry_msgs.msg import PoseStamped, Pose
from tf.transformations import euler_from_quaternion

class GUI_Controller():

  def __init__(self):
    # When this node shutsdown
    rospy.on_shutdown(self.shutdown_sequence)

    # Set the rate
    self.rate = 10.0
    self.dt = 1.0 / self.rate

    # Create the position
    self.position1 = np.zeros(3, dtype=np.float64)
    self.position2 = np.zeros(3, dtype=np.float64)
    self.position3 = np.zeros(3, dtype=np.float64)
    self.quaternion1 = np.zeros(4)
    self.quaternion2 = np.zeros(4)
    self.quaternion3 = np.zeros(4)

    gui_data = {'quad1':{'position':[0, 0, 0],'orientation':[0, 0, 0], 'L':1},
                'quad2':{'position':[0, 0, 0],'orientation':[0, 0, 0], 'L':1},
                'quad3':{'position':[0, 0, 0],'orientation':[0, 0, 0], 'L':1}}

    # Create the gui object
    self.gui_object = GUI(quads=gui_data)

    # Declare the uav name
    self.uavName1 = rospy.get_param(str(rospy.get_name()) + '/uavName1', "uav")
    self.uavName2 = rospy.get_param(str(rospy.get_name()) + '/uavName2', "uav")
    self.uavName3 = rospy.get_param(str(rospy.get_name()) + '/uavName3', "uav")

    # Create the subscribers and publishers
    self.gps_sub1 = rospy.Subscriber(self.uavName1 + "/sensors/gps", PoseStamped, self.get_gps1)
    self.gps_sub2 = rospy.Subscriber(self.uavName2 + "/sensors/gps", PoseStamped, self.get_gps2)
    self.gps_sub3 = rospy.Subscriber(self.uavName3 + "/sensors/gps", PoseStamped, self.get_gps3)

    # Run the communication node
    self.UpdateLoop()


  # This is the main loop of this class
  def UpdateLoop(self):
    # Set the rate
    rate = rospy.Rate(self.rate)

    # While running
    while not rospy.is_shutdown():

        # Display the position
        self.gui_object.quads['quad1']['position'] = list(self.position1)
        self.gui_object.quads['quad1']['orientation'] = list(euler_from_quaternion(self.quaternion1))

        self.gui_object.quads['quad2']['position'] = list(self.position2)
        self.gui_object.quads['quad2']['orientation'] = list(euler_from_quaternion(self.quaternion2))

        self.gui_object.quads['quad3']['position'] = list(self.position3)
        self.gui_object.quads['quad3']['orientation'] = list(euler_from_quaternion(self.quaternion3))
        self.gui_object.update()

        # Sleep any excess time
        rate.sleep()

  # Call back to get the gps data
  def get_gps1(self, msg):
    self.position1[0] = msg.pose.position.x
    self.position1[1] = msg.pose.position.y
    self.position1[2] = msg.pose.position.z

    self.quaternion1 = (msg.pose.orientation.x,
                       msg.pose.orientation.y,
                       msg.pose.orientation.z,
                       msg.pose.orientation.w)


  def get_gps2(self, msg):
    self.position2[0] = msg.pose.position.x
    self.position2[1] = msg.pose.position.y
    self.position2[2] = msg.pose.position.z

    self.quaternion2 = (msg.pose.orientation.x,
                       msg.pose.orientation.y,
                       msg.pose.orientation.z,
                       msg.pose.orientation.w)

  def get_gps3(self, msg):
    self.position3[0] = msg.pose.position.x
    self.position3[1] = msg.pose.position.y
    self.position3[2] = msg.pose.position.z

    self.quaternion3 = (msg.pose.orientation.x,
                       msg.pose.orientation.y,
                       msg.pose.orientation.z,
                       msg.pose.orientation.w)

	# Called on ROS shutdown
  def shutdown_sequence(self):
    rospy.loginfo(str(rospy.get_name()) + ": Shutting Down")
    
def main():
  rospy.init_node('GUI_Controller_Node')
  try:
    v = GUI_Controller()
  except rospy.ROSInterruptException:
    pass


if __name__ == '__main__':
  main()
