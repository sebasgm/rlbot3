#!/usr/bin/env python

PKG = 'rlbot3'
import roslib; roslib.load_manifest(PKG) # Do roslib add depedencies and read manifest.xml (Not necessary on Groovy)

import sys 

import rospy

#import numpy as np
#from math import atan2, pi

from std_msgs.msg import * 
from rlbot3.msg import motorsPWM
import std_srvs.srv

# Import PyBBIO library:
from bbio import *

from time import strftime, gmtime
import time


rospy.init_node('vel_control', anonymous=True) # Node initialization

# Topic and msg type
pub_state = rospy.Publisher('/rlbot3/vel_control_node_state', Bool)
pub_velocity = rospy.Publisher('/rlbot3/cmd_velocity', motorsPWM) # (HERE then should be  published velocity data with corresponding transformation from externally V and W data received to PWM)

init_time = int(strftime("%S", gmtime()))

def action_callback(vel_data):
   rospy.loginfo("PWM value: %f", vel_data)


def vel_control_node():
    global init_time

    rospy.Subscriber('/rlbot3/distance_ir_sensor_measure', Float32, action_callback)

    while not rospy.is_shutdown():

        reset_time = int(strftime("%S", gmtime()))
        diff_time = abs(reset_time - init_time)

        # Add in the callback a PID routine to control the robot. And add at the beginning the setup() for motors
    

#        action_callback(distance_read)

        if diff_time >= 2:
            init_time = int(strftime("%S", gmtime()))
            pub_state.publish(Bool(True))
            rospy.sleep(0.25)


    rospy.spin()


if __name__ == '__main__':
    try:
        vel_control_node()
    except rospy.ROSInterruptException: pass
