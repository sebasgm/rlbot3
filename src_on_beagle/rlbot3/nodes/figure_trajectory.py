#!/usr/bin/env python

PKG = 'rlbot3'
import roslib; roslib.load_manifest(PKG) # Do roslib add depedencies and read manifest.xml (Not necessary on Groovy)

import sys 

import rospy

import numpy as np
from math import atan2, pi

from std_msgs.msg import String 
from rlbot3.msg import motorsPWM
import std_srvs.srv

# Import PyBBIO library:
from bbio import *

rospy.init_node('figure_trajectory', anonymous=True) # Node initialization
#pub = rospy.Publisher('/rlbot3/trajectories', Velocity) # Topic and msg type, names

turtle_x = 0.0
turtle_y = 0.0
turtle_angle = 0.0
turtle_x_init = 0.0
turtle_y_init = 0.0
turtle_angle_init = 0.0


def callback_pose(data_pose):
   rospy.loginfo("angulo %s",data_pose.theta)

    global turtle_x
    global turtle_y
    global turtle_angle

    turtle_x = data_pose.x
    turtle_y = data_pose.y
    turtle_angle = data_pose.theta


def callback(data):

    global turtle_x 
    global turtle_y 
    global turtle_angle 

    selected_figure = data.data # Guardo el dato del mensaje, para mayor representatividad en el codigo

    if selected_figure == "circle":
        str = "Recorriendo Circulo" # Genero el mensaje a enviar
        rospy.loginfo(str) # Esta linea saca por rosout el mensaje publicado por el nodo al topic

        # Defino velocidades para el trazado de la figura.

# Recorro la figura "circulo" en funcion de la posicion inicial y la actual
        turtle_angle_init = turtle_angle 
        turtle_angle = 0.0
        while (turtle_angle - turtle_angle_init) % (2*pi) < (2*pi - pi/8):   
            pub.publish(Velocity(linear_vel, angular_vel)) #Publico el mensaje asociado a las velocidades de la tortuga, en el nodo de turtlesim


    elif selected_figure == "square":
        str = "Recorriendo Cuadrado"
        rospy.loginfo(str) # Esta linea saca por rosout el mensaje publicado por el nodo al topic

        # Defino velocidades para el trazado de la figura.

        # Inicio la secuencia para la figura cuadrado
        pub.publish(Velocity(linear_vel, 0))
        rospy.sleep(1.0)

        turtle_angle_init = turtle_angle
 
        while (turtle_angle - turtle_angle_init) % (2*pi) < pi/2:   
            pub.publish(Velocity(0, angular_vel))

        
        pub.publish(Velocity(linear_vel, 0))
        rospy.sleep(1.0)

        turtle_angle_init = turtle_angle
        while (turtle_angle - turtle_angle_init) % (2*pi) < pi/2:   
            pub.publish(Velocity(0, angular_vel))

        pub.publish(Velocity(linear_vel, 0))
        rospy.sleep(1.0)
 
        turtle_angle_init = turtle_angle
        while (turtle_angle - turtle_angle_init) % (2*pi) < pi/2:   
            pub.publish(Velocity(0, angular_vel))

        pub.publish(Velocity(linear_vel, 0))
        rospy.sleep(1.0)
      

    elif selected_figure == "triangle":
        str = "\n Recorriendo Triangulo"
        rospy.loginfo(str) # Esta linea saca por rosout el mensaje publicado por el nodo al topic


def figure_trajectories():

    rospy.Subscriber('/rlbot3/figure_trajectory', String, callback)
    rospy.Subscriber('/rlbot3/pose', Pose, callback_pose)rospy.spin()
     

if __name__ == '__main__':
    try:
        figure_trajectories()
    except rospy.ROSInterruptException: pass

