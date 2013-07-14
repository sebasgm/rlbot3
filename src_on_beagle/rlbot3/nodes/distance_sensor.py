#!/usr/bin/env python

PKG = 'rlbot3'
import roslib; roslib.load_manifest(PKG) # Do roslib add depedencies and read manifest.xml (Not necessary on Groovy)

import sys 

import rospy

#import numpy as np
from math import atan2, pi

from std_msgs.msg import * 
#from rlbot3.msg import motorsPWM
import std_srvs.srv

# Import PyBBIO library:
from bbio import *

from time import strftime, gmtime
import time 



rospy.init_node('distance_sensor', anonymous=True) # Node initialization

# Topic and msg type, names
pub_state = rospy.Publisher('/rlbot3/distance_ir_sensor_state', Bool) # This topic is for pulish a sort of "keep alive" msg
pub_measure = rospy.Publisher('/rlbot3/distance_ir_sensor_measure', Float32) # This topic expose the actual value of the IR distance measure

init_time = int(strftime("%S", gmtime())) # Set time for keep alive msg 


def action_callback(distance_data):
#    d=(39.395+((23.023*((1.0/(float(distance_data)*3.3))-1.4068))/0.71562)); # This works just for MBED, there is necessary to run again the
# learning algorithm using values from this board working with 3.3V

    rospy.loginfo("distance measure: %i", distance_data)

    # Process the data in order to return a real distance value

    pub_measure.publish(Float32(distance_data)) #In the future should be a way to determime if actually there is a new measure
    rospy.sleep(0.25)
 

def distance_sensor_node():
    global init_time

    while not rospy.is_shutdown():

        distance_read = analogRead(AIN0)

        # Could be a god idea to test the result of the measure to discard a value when is out of range and drop a WARN

        rospy.sleep(0.05) # Add a delay to wait for a well formed convertion
 
        reset_time = int(strftime("%S", gmtime()))
        diff_time = abs(reset_time - init_time)

        action_callback(distance_read)

        if diff_time >= 2:
            init_time = int(strftime("%S", gmtime()))
            pub_state.publish(Bool(True))	
            rospy.sleep(0.25)

    rospy.spin()


if __name__ == '__main__':
    try:
        distance_sensor_node()
    except rospy.ROSInterruptException: pass
