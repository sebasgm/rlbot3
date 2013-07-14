#!/usr/bin/env python

PKG = 'rlbot3'
import roslib; roslib.load_manifest(PKG) # Do roslib add depedencies and read manifest.xml (Not necessary on Groovy)

import sys 

import rospy

#import numpy as np
#from math import atan2, pi

from std_msgs.msg import String 
#from rlbot3.msg import motorsPWM
import std_srvs.srv

# Import PyBBIO library:
from bbio import *

rospy.init_node('cliff_sensor', anonymous=True) # Node initialization
pub_state = rospy.Publisher('/rlbot3/cliff_sensor_state', Bool) # Topic and msg type, names

init_time = int(strftime("%S", gmtime())) # Set time for keep alive msg 

cliff_sensor_setup() # Set the corresponding port for sensor reading


def cliff_sensor_setup()
    # Set the GPIO pins:
    pinMode(USR3, OUTPUT)
    pinMode(GPIO1_6, INPUT)   # CLIF SENSOR


def action_callback(cliff_data):
   rospy.loginfo("cliff_state: %", cliff_data)

   digitalWrite(USR3, state) # Set or clear one user LED to test if the node is working SHOULD BE ELIMINATED


def cliff_sensor_node():
    reset_time = int(strftime("%S", gmtime()))
    diff_time = abs(reset_time - init_time)

    state = digitalRead(GPIO1_6)
    action_callback(state)

    if diff_time >= 5:
        init_time = int(strftime("%S", gmtime()))
        pub_state.publish(Bool(True))
        rospy.sleep(0.25)


    rospy.spin()


if __name__ == '__main__':
    try:
        cliff_sensor_node()
    except rospy.ROSInterruptException: pass
