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

rospy.init_node('master_control', anonymous=True) # Node initialization

pinMode(USR3, OUTPUT)

init_time_cliff = int(strftime("%S", gmtime()))
init_time_distance = int(strftime("%S", gmtime()))
init_time_vel = int(strftime("%S", gmtime()))


def cliff_state_callback(callback_data):
    global init_time_cliff
    init_time_cliff = int(strftime("%S", gmtime()))
    # This callback should be capable of returns warnings or errors when a node is dead. And hopefully should be capable of reinit this node 
    # as well as in fact, use a service to comunicate waiting for response, not just a msg.


def vel_node_state_callback(callback_data):
    global init_time_vel
    init_time_vel = int(strftime("%S", gmtime()))
    # This callback should be capable of returns warnings or errors when a node is dead. And hopefully should be capable of reinit this node 
    # as well as in fact, use a service to comunicate waiting for response, not just a msg.


def distance_sensor_state_callback(callback_data):
    global init_time_distance
    init_time_distance = int(strftime("%S", gmtime()))


    # This callback should be capable of returns warnings or errors when a node is dead. And hopefully should be capable of reinit this node 
    # as well as in fact, use a service to comunicate waiting for response, not just a msg.


def master_control_node():
    global init_time_cliff
    global init_time_distance
    global init_time_vel

    rospy.loginfo("'Master Control node' active")
    rospy.sleep(1)

    while not rospy.is_shutdown():

        digitalWrite(USR3, HIGH)
        rospy.sleep(0.5)
        digitalWrite(USR3,LOW)

    # Muevo la tortuga a una posicion inicial cada vez que se recibe el msg de una nueva figura
#    teleport = rospy.ServiceProxy('/turtle1/teleport_absolute', turtlesim.srv.TeleportAbsolute)
#    teleport(5, 5, 0)

#        rospy.Subscriber('/rlbot3/camera_node_state', Bool, camera_node_state_callback)
#        rospy.Subscriber('/rlbot3/encoders_state', Bool, encoder_state_callback)
        rospy.Subscriber('/rlbot3/cliff_sensor_state', Bool, cliff_state_callback)
        rospy.Subscriber('/rlbot3/distance_ir_sensor_state', Bool, distance_sensor_state_callback)
        rospy.Subscriber('/rlbot3/vel_control_node_state', Bool, vel_node_state_callback)

        reset_time = int(strftime("%S", gmtime()))
        diff_time_cliff = abs(reset_time - init_time_cliff)
        diff_time_distance = abs(reset_time - init_time_distance)
        diff_time_vel = abs(reset_time - init_time_vel)
    

        if diff_time_cliff >= 4:
            rospy.logwarn("Cliff sensor is not responding")
            rospy.sleep(0.25)
        if diff_time_distance >= 4:
            rospy.logwarn("Distance sensor is not responding")
            rospy.sleep(0.25)

        if diff_time_vel >= 4:
            rospy.logwarn("Velocity control node is not responding")
            rospy.sleep(0.25)


    rospy.spin()


if __name__ == '__main__':
    try:
        master_control_node()
    except rospy.ROSInterruptException: pass

