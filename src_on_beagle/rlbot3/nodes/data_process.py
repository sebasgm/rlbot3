#!/usr/bin/env python

PKG = 'rlbot3'
import roslib; roslib.load_manifest(PKG) # Do roslib add depedencies and read manifest.xml (Not necessary on Groovy)

import sys 

import rospy

#import numpy as np
#from math import atan2, pi

from std_msgs.msg import String 
from rlbot3.msg import motorsPWM
import std_srvs.srv

# Import PyBBIO library:
from bbio import *

rospy.init_node('master_control', anonymous=True) # Node initialization


def gloabl_state_callback(callback_data):
    rospy.loginfo("global_state: %s", str(callback_data)) #THIS IS NOT CORRECT BECAUSE THE DATA IS MIXED. FIX!!!!!

def master_control_node():

    # Muevo la tortuga a una posicion inicial cada vez que se recibe el msg de una nueva figura
#    teleport = rospy.ServiceProxy('/turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute)
#    teleport(5, 5, 0)

    rospy.Subscriber('/rlbot3/cliff_sensor_state', Bool, global_state_callback)
    rospy.Subscriber('/rlbot3/distance_ir_sensor_state', Bool, global_state_callback)
    rospy.spin()


if __name__ == '__main__':
    try:
        master_control_node()
    except rospy.ROSInterruptException: pass

