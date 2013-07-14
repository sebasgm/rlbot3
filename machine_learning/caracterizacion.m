close all;
clear all;

# =============== Estos valores de entrenamiento (tomamoas varias mediciones del mismos punto, para cada punto) =============== # 

#Tomamos las "y" como salida las distancias, porque queremos graficar distancia en funcion de la tension:
#y = [10 10 10 10 10 12 12 12 12 12 16 16 16 16 16 20 20 20 20 20 30 30 30 30 30 33 33 33 33 33 40 40 40 40 40 50 50 50 50 50 54 54 54 54 54 60 60 60 60 60 70 70 70 70 70 75 75 75 75 75 80 80 80 80 80];

#x = [2.324908 2.314432 2.313627 2.312015 2.312821 1.934872 1.934066 1.930843 1.926813 1.929231 1.490843 1.490037 1.491648 1.491648 1.494066 1.244249 1.241026 1.241832 1.242638 1.286154 0.848571 0.852601 0.851795 0.854213 0.846154 0.772821 0.773626 0.775238 0.815531 0.775238 0.660806 0.660806 0.704322 0.661612 0.661612 0.523810 0.545568 0.547985 0.546374 0.529451 0.529451 0.546374 0.556044 0.510110 0.489963 0.469817 0.473040 0.529451 0.472234 0.471429 0.412601 0.455311 0.435971 0.414212 0.415824 0.391648 0.453700 0.448864 0.408571 0.410183 0.392454 0.390843 0.430330 0.389231 0.391648];


# =============== Para graficar usamos las muestras de entrenamiento sin repetir =============== # 

#Tomamos como salida las distancias:
y = [10 12 16 20 30 33 40 50 54 60 70 75 80];

#Las mediciones de tension los consideramos la entrada:
# x = [2.324908 1.934872 1.490843 1.244249 0.848571 0.772821 0.660806 0.523810 0.529451 0.469817 0.412601  0.391648 0.392454];
# CAMBIAR MEDICIONES POR LAS DE LA BEAGLE, QUE TRABAJA A OTRA TENSION


figure(1)
plot(1./x,y, "k")
hold on;

#Caracterizacion de la funcion de distancia con los parametros obtenidos del aprendizaje. Le restamos a las "x" la media, y dividimos por el desvio. Porque el aprendizaje si hizo a partir de las "x" normalizadas
d = 39.395 + 23.023*(x.^-1 - 1.4068)/0.71562;

plot(1./x, d);

figure(3)
plot(x,y, "k")
hold on;

d = 39.395 + 23.023*(x.^-1 - 1.4068)/0.71562;
plot(x, d);




