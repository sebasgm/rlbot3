#!/usr/bin/env python
import roslib; roslib.load_manifest('rlbot3') # Hace que roslib lea el manifest y agregue las dependencias del paquete

import rospy

from std_msgs.msg import String # Se importan mensages estandar 
from rlbot3.msg import * # Se importan mensages estandar 

import std_srvs.srv

def talker(): # Defino el nodo que publica mensajes
#    pub2 = rospy.Publisher('/figure', String)
    rospy.init_node("dummy_test") # Indica el nombre del nodo, lo cual es necesario para poder empezar a conversar con el Master
   
    while not rospy.is_shutdown(): # Hacer mientras que el programa no haya sido cerrado.
        #rospy.loginfo(str) # Esta linea saca por rosout el mensaje publicado por el nodo al topic (correspondia a un msg que ya no esta)

        str2 = raw_input("Indique el movimiento a realizar (circle | square | triangle): ") # Genero el mensaje a enviar
        pub2.publish(String(str2)) # Publica el mensaje en el topic asociado. Como 'listener' es un nodo conectado a este topic, recibe estos mensajes

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException: pass
