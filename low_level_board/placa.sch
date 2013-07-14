EESchema Schematic File Version 2  date sáb 29 jun 2013 14:44:33 ART
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ptn04050c
LIBS:reg_104-5
LIBS:atmega168
LIBS:L298
LIBS:placa-cache
EELAYER 25  0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Placa robot (sh)"
Date "19 feb 2013"
Rev "2.5"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +3.3V #PWR01
U 1 1 4F01ED20
P 2950 3000
F 0 "#PWR01" H 2950 2960 30  0001 C CNN
F 1 "+3.3V" H 2950 3110 30  0000 C CNN
	1    2950 3000
	1    0    0    -1  
$EndComp
Connection ~ 4150 3200
Connection ~ 4150 2800
Wire Wire Line
	3950 1500 4300 1500
Connection ~ 3950 1700
Connection ~ 3950 1500
Connection ~ 3450 3350
Connection ~ 2950 1500
Connection ~ 3750 1500
Wire Wire Line
	6900 3850 6900 3750
Connection ~ 3850 750 
Connection ~ 3350 750 
Connection ~ 2950 750 
Connection ~ 5250 4150
Connection ~ 5500 4250
Connection ~ 5850 4350
Connection ~ 6100 4450
Wire Wire Line
	6450 4550 6900 4550
Wire Wire Line
	6900 4450 6100 4450
Wire Wire Line
	5250 4150 6900 4150
Connection ~ 6900 4550
Connection ~ 6900 4450
Connection ~ 6900 4350
Connection ~ 6900 4250
Connection ~ 6900 4150
Wire Wire Line
	2550 1500 2950 1500
Connection ~ 7750 5000
Connection ~ 5450 4050
Connection ~ 5450 3950
Connection ~ 5850 3950
Connection ~ 6900 4050
Connection ~ 6900 3950
Wire Wire Line
	9250 5250 9250 4900
Wire Wire Line
	9250 3950 9250 3650
Connection ~ 9650 4300
Connection ~ 8850 4300
Wire Wire Line
	8600 4550 8600 4900
Wire Wire Line
	8600 4900 9250 4900
Wire Wire Line
	8850 5250 8850 5400
Wire Wire Line
	8600 4050 8700 4050
Wire Wire Line
	8700 4050 8700 3650
Wire Wire Line
	8700 3650 9250 3650
Connection ~ 6900 3850
Wire Wire Line
	8600 3450 9250 3450
Connection ~ 2700 1500
Connection ~ 8600 3950
Connection ~ 8600 4050
Connection ~ 9250 3450
Connection ~ 9250 3650
Connection ~ 9250 4700
Connection ~ 9250 4900
Connection ~ 8600 4450
Connection ~ 8600 4550
Connection ~ 6900 3750
Connection ~ 6900 4650
Wire Wire Line
	5450 4050 5450 3950
Wire Wire Line
	8600 3450 8600 3950
Wire Wire Line
	8850 3950 8850 4400
Wire Wire Line
	8850 3100 8850 3250
Connection ~ 8850 5250
Connection ~ 9250 3950
Connection ~ 8850 3950
Connection ~ 8850 4400
Connection ~ 8850 5400
Connection ~ 9250 4300
Connection ~ 9650 3950
Connection ~ 9650 5250
Connection ~ 9250 5250
Connection ~ 9250 3100
Connection ~ 8850 3100
Connection ~ 8850 3250
Connection ~ 9650 3100
Wire Wire Line
	8700 4700 9250 4700
Wire Wire Line
	8700 4700 8700 4450
Wire Wire Line
	8700 4450 8600 4450
Wire Wire Line
	9250 3450 9250 3100
Wire Wire Line
	9250 4700 9250 4300
Wire Wire Line
	6900 3950 5850 3950
Connection ~ 3450 2050
Wire Wire Line
	6900 4250 5500 4250
Wire Wire Line
	5850 4350 6900 4350
Connection ~ 3850 850 
Wire Wire Line
	3750 1400 3750 1500
Wire Wire Line
	6900 3750 6600 3750
Wire Wire Line
	6600 3750 6600 3800
Connection ~ 6600 3800
Wire Wire Line
	2950 2100 2950 2200
Connection ~ 2950 2100
Connection ~ 2950 2200
Connection ~ 2950 2800
Connection ~ 2550 3200
Connection ~ 3950 2800
Connection ~ 3950 3000
Connection ~ 4300 1500
Connection ~ 4300 1900
Connection ~ 2950 1700
Connection ~ 2950 3000
Wire Wire Line
	3950 2800 4150 2800
$Comp
L C C5
U 1 1 4F01ECFE
P 4150 3000
F 0 "C5" H 4200 3100 50  0000 L CNN
F 1 "10n" H 4200 2900 50  0000 L CNN
	1    4150 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 4F01ECEF
P 3450 3350
F 0 "#PWR02" H 3450 3350 30  0001 C CNN
F 1 "GND" H 3450 3280 30  0001 C CNN
	1    3450 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 4F01ECEC
P 2550 3200
F 0 "#PWR03" H 2550 3200 30  0001 C CNN
F 1 "GND" H 2550 3130 30  0001 C CNN
	1    2550 3200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 4F01ECC5
P 2950 2800
F 0 "#PWR04" H 2950 2890 20  0001 C CNN
F 1 "+5V" H 2950 2890 30  0000 C CNN
	1    2950 2800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 4F01ECB3
P 2950 1700
F 0 "#PWR05" H 2950 1790 20  0001 C CNN
F 1 "+5V" H 2950 1790 30  0000 C CNN
	1    2950 1700
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 4F01EC47
P 4300 1700
F 0 "C6" H 4350 1800 50  0000 L CNN
F 1 "10n" H 4350 1600 50  0000 L CNN
	1    4300 1700
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4F01EAD5
P 2550 3000
F 0 "C1" H 2600 3100 50  0000 L CNN
F 1 "100n" H 2600 2900 50  0000 L CNN
	1    2550 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 4EFCDF0B
P 2950 2200
F 0 "#PWR06" H 2950 2200 30  0001 C CNN
F 1 "GND" H 2950 2130 30  0001 C CNN
	1    2950 2200
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C3
U 1 1 4EFCDE8E
P 2950 1900
F 0 "C3" H 3000 2000 50  0000 L CNN
F 1 "10u" H 3000 1800 50  0000 L CNN
	1    2950 1900
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP1
U 1 1 4EFCDDED
P 2250 1500
F 0 "JP1" H 2250 1650 60  0000 C CNN
F 1 "JP_ENABLE" H 2250 1420 40  0000 C CNN
	1    2250 1500
	1    0    0    -1  
$EndComp
$Comp
L L298D U3
U 1 1 4BEB8038
P 7750 4250
F 0 "U3" H 7750 4250 60  0000 C CNN
F 1 "L298D" H 7750 4350 60  0000 C CNN
	1    7750 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 4D321F86
P 3850 850
F 0 "#PWR07" H 3850 850 30  0001 C CNN
F 1 "GND" H 3850 780 30  0001 C CNN
	1    3850 850 
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4D321F7D
P 3600 750
F 0 "R1" V 3680 750 50  0000 C CNN
F 1 "120" V 3600 750 50  0000 C CNN
	1    3600 750 
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 4D321F6F
P 3150 750
F 0 "D1" H 3150 600 50  0000 C CNN
F 1 "LED" H 3150 650 50  0000 C CNN
	1    3150 750 
	1    0    0    -1  
$EndComp
Text Notes 7550 3450 0    60   ~ 0
Puente H
$Comp
L +5V #PWR08
U 1 1 4C056688
P 6900 4050
F 0 "#PWR08" H 6900 4140 20  0001 C CNN
F 1 "+5V" V 6900 4200 30  0000 C CNN
	1    6900 4050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR09
U 1 1 4BED9F85
P 7750 5000
F 0 "#PWR09" H 7750 5000 30  0001 C CNN
F 1 "GND" H 7750 4930 30  0001 C CNN
	1    7750 5000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 4BEC3F48
P 3750 1400
F 0 "#PWR010" H 3750 1490 20  0001 C CNN
F 1 "+5V" H 3750 1500 30  0000 C CNN
	1    3750 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 4BEC20D5
P 8850 3250
F 0 "#PWR011" H 8850 3250 30  0001 C CNN
F 1 "GND" H 8850 3180 30  0001 C CNN
	1    8850 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 4BEC20D3
P 8850 5400
F 0 "#PWR012" H 8850 5400 30  0001 C CNN
F 1 "GND" H 8850 5330 30  0001 C CNN
	1    8850 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 4BEC20D1
P 8850 4400
F 0 "#PWR013" H 8850 4400 30  0001 C CNN
F 1 "GND" H 8850 4330 30  0001 C CNN
	1    8850 4400
	1    0    0    -1  
$EndComp
$Comp
L DIODE D9
U 1 1 4BEC2092
P 9450 3100
F 0 "D9" H 9450 3200 40  0000 C CNN
F 1 "1N4148" H 9450 3000 40  0000 C CNN
	1    9450 3100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D5
U 1 1 4BEC2090
P 9050 3100
F 0 "D5" H 9050 3200 40  0000 C CNN
F 1 "1N4148" H 9050 3000 40  0000 C CNN
	1    9050 3100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D11
U 1 1 4BEC208D
P 9450 4300
F 0 "D11" H 9450 4400 40  0000 C CNN
F 1 "1N4148" H 9450 4200 40  0000 C CNN
	1    9450 4300
	1    0    0    -1  
$EndComp
$Comp
L DIODE D7
U 1 1 4BEC208A
P 9050 4300
F 0 "D7" H 9050 4400 40  0000 C CNN
F 1 "1N4148" H 9050 4200 40  0000 C CNN
	1    9050 4300
	1    0    0    -1  
$EndComp
$Comp
L DIODE D10
U 1 1 4BEC2088
P 9450 3950
F 0 "D10" H 9450 4050 40  0000 C CNN
F 1 "1N4148" H 9450 3850 40  0000 C CNN
	1    9450 3950
	1    0    0    -1  
$EndComp
$Comp
L DIODE D6
U 1 1 4BEC2086
P 9050 3950
F 0 "D6" H 9050 4050 40  0000 C CNN
F 1 "1N4148" H 9050 3850 40  0000 C CNN
	1    9050 3950
	1    0    0    -1  
$EndComp
$Comp
L DIODE D12
U 1 1 4BEC207F
P 9450 5250
F 0 "D12" H 9450 5350 40  0000 C CNN
F 1 "1N4148" H 9450 5150 40  0000 C CNN
	1    9450 5250
	1    0    0    -1  
$EndComp
$Comp
L DIODE D8
U 1 1 4BEC207B
P 9050 5250
F 0 "D8" H 9050 5350 40  0000 C CNN
F 1 "1N4148" H 9050 5150 40  0000 C CNN
	1    9050 5250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 4BEC1AC8
P 5450 4050
F 0 "#PWR014" H 5450 4050 30  0001 C CNN
F 1 "GND" H 5450 3980 30  0001 C CNN
	1    5450 4050
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 4BEC1A50
P 5650 3950
F 0 "C7" V 5550 3850 50  0000 L CNN
F 1 "100n" V 5450 3850 50  0000 L CNN
	1    5650 3950
	0    1    1    0   
$EndComp
$Comp
L CONN_2 P6
U 1 1 4BEB80F9
P 9600 4800
F 0 "P6" H 9600 4800 40  0000 C CNN
F 1 "MOTOR_R" H 9650 4600 40  0000 C CNN
	1    9600 4800
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P5
U 1 1 4BEB80F1
P 9600 3550
F 0 "P5" H 9600 3550 40  0000 C CNN
F 1 "MOTOR_L" H 9650 3750 40  0000 C CNN
	1    9600 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 4BEB809E
P 6600 3800
F 0 "#PWR015" H 6600 3800 30  0001 C CNN
F 1 "GND" H 6600 3730 30  0001 C CNN
	1    6600 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 4BEAFE8C
P 3450 2050
F 0 "#PWR016" H 3450 2050 30  0001 C CNN
F 1 "GND" H 3450 1980 30  0001 C CNN
	1    3450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1900 2700 2300
Wire Wire Line
	2700 2100 2950 2100
$Comp
L C C2
U 1 1 5120178F
P 2700 1700
F 0 "C2" H 2750 1800 50  0000 L CNN
F 1 "100n" H 2750 1600 50  0000 L CNN
	1    2700 1700
	1    0    0    -1  
$EndComp
Text Label 2550 1200 2    60   ~ 0
ENABLE_5V
$Comp
L REG_104-5 U1
U 1 1 4F01EA82
P 3450 1600
F 0 "U1" H 3200 1800 60  0000 C CNN
F 1 "REG_104-5" H 3450 1900 60  0000 C CNN
	1    3450 1600
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR017
U 1 1 512017C4
P 2700 1500
F 0 "#PWR017" H 2700 1450 20  0001 C CNN
F 1 "+BATT" H 2700 1600 30  0000 C CNN
	1    2700 1500
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR018
U 1 1 512017DD
P 5850 3950
F 0 "#PWR018" H 5850 3900 20  0001 C CNN
F 1 "+BATT" H 5850 4050 30  0000 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR019
U 1 1 512017F6
P 9650 3100
F 0 "#PWR019" H 9650 3050 20  0001 C CNN
F 1 "+BATT" H 9650 3200 30  0000 C CNN
	1    9650 3100
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR020
U 1 1 5120180F
P 9650 3950
F 0 "#PWR020" H 9650 3900 20  0001 C CNN
F 1 "+BATT" H 9650 4050 30  0000 C CNN
	1    9650 3950
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR021
U 1 1 5120181E
P 9650 4300
F 0 "#PWR021" H 9650 4250 20  0001 C CNN
F 1 "+BATT" H 9650 4400 30  0000 C CNN
	1    9650 4300
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR022
U 1 1 5120182D
P 9650 5250
F 0 "#PWR022" H 9650 5200 20  0001 C CNN
F 1 "+BATT" H 9650 5350 30  0000 C CNN
	1    9650 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1200 2550 1500
Text Label 3950 1700 3    60   ~ 0
ENABLE_5V
$Comp
L CONN_2 P1
U 1 1 51201ABA
P 1350 1600
F 0 "P1" V 1300 1600 40  0000 C CNN
F 1 "BATT" V 1400 1600 40  0000 C CNN
	1    1350 1600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR023
U 1 1 51201AC9
P 1700 1950
F 0 "#PWR023" H 1700 1950 30  0001 C CNN
F 1 "GND" H 1700 1880 30  0001 C CNN
	1    1700 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 51201B5C
P 4300 1900
F 0 "#PWR024" H 4300 1900 30  0001 C CNN
F 1 "GND" H 4300 1830 30  0001 C CNN
	1    4300 1900
	1    0    0    -1  
$EndComp
Text Label 3950 3000 3    60   ~ 0
ENABLE_3.3V
$Comp
L GND #PWR025
U 1 1 51201B6C
P 4150 3200
F 0 "#PWR025" H 4150 3200 30  0001 C CNN
F 1 "GND" H 4150 3130 30  0001 C CNN
	1    4150 3200
	1    0    0    -1  
$EndComp
$Comp
L REG_104-5 U2
U 1 1 4F01EA8C
P 3450 2900
F 0 "U2" H 3200 3100 60  0000 C CNN
F 1 "REG_104-3.3" H 3450 3200 60  0000 C CNN
	1    3450 2900
	1    0    0    -1  
$EndComp
Text Label 2550 2800 2    60   ~ 0
ENABLE_3.3V
$Comp
L C C4
U 1 1 51201B7F
P 2950 3200
F 0 "C4" H 3000 3300 50  0000 L CNN
F 1 "100n" H 3000 3100 50  0000 L CNN
	1    2950 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 51201B93
P 2950 3400
F 0 "#PWR026" H 2950 3400 30  0001 C CNN
F 1 "GND" H 2950 3330 30  0001 C CNN
	1    2950 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2800 2550 2800
Wire Wire Line
	3850 750  3850 850 
$Comp
L +5V #PWR027
U 1 1 51201D88
P 2950 750
F 0 "#PWR027" H 2950 840 20  0001 C CNN
F 1 "+5V" H 2950 840 30  0000 C CNN
	1    2950 750 
	1    0    0    -1  
$EndComp
Text Label 6400 5300 2    60   ~ 0
PWM_L
Text Label 6400 4850 2    60   ~ 0
PWM_R
Text Label 6400 5050 2    60   ~ 0
IN_1
Text Label 6400 4950 2    60   ~ 0
IN_2
Text Label 6400 5400 2    60   ~ 0
IN_3
Text Label 6400 5500 2    60   ~ 0
IN_4
Text Label 5850 4350 2    60   ~ 0
PWM_L
Text Label 6900 4650 2    60   ~ 0
PWM_R
Text Label 5250 4150 2    60   ~ 0
IN_1
Text Label 5500 4250 2    60   ~ 0
IN_2
Text Label 6100 4450 2    60   ~ 0
IN_3
Text Label 6450 4550 2    60   ~ 0
IN_4
$Comp
L CONN_5X2 P2
U 1 1 512160FF
P 5350 2750
F 0 "P2" H 5350 3050 60  0000 C CNN
F 1 "Header_3.3V" V 5350 2750 50  0000 C CNN
	1    5350 2750
	1    0    0    -1  
$EndComp
$Comp
L CONN_3X2 P4
U 1 1 51216122
P 9550 1000
F 0 "P4" H 9550 1250 50  0000 C CNN
F 1 "Header_ADC" V 9550 1050 40  0000 C CNN
	1    9550 1000
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 51216136
P 7000 850
F 0 "R2" V 7080 850 50  0000 C CNN
F 1 "10k" V 7000 850 50  0000 C CNN
	1    7000 850 
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 51216145
P 7250 1100
F 0 "R5" V 7330 1100 50  0000 C CNN
F 1 "10k" V 7250 1100 50  0000 C CNN
	1    7250 1100
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 51216154
P 7250 1800
F 0 "R6" V 7330 1800 50  0000 C CNN
F 1 "10k" V 7250 1800 50  0000 C CNN
	1    7250 1800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 51216163
P 7000 1550
F 0 "R3" V 7080 1550 50  0000 C CNN
F 1 "10k" V 7000 1500 50  0000 L CNN
	1    7000 1550
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 51216170
P 7250 2500
F 0 "R7" V 7330 2500 50  0000 C CNN
F 1 "10k" V 7250 2500 50  0000 C CNN
	1    7250 2500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 51216176
P 7000 2250
F 0 "R4" V 7080 2250 50  0000 C CNN
F 1 "10k" V 7000 2250 50  0000 C CNN
	1    7000 2250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR028
U 1 1 5121629A
P 7250 1350
F 0 "#PWR028" H 7250 1350 30  0001 C CNN
F 1 "GND" H 7250 1280 30  0001 C CNN
	1    7250 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 512162A9
P 7250 2050
F 0 "#PWR029" H 7250 2050 30  0001 C CNN
F 1 "GND" H 7250 1980 30  0001 C CNN
	1    7250 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 512162B8
P 7250 2750
F 0 "#PWR030" H 7250 2750 30  0001 C CNN
F 1 "GND" H 7250 2680 30  0001 C CNN
	1    7250 2750
	1    0    0    -1  
$EndComp
Text Label 6750 1550 3    60   ~ 0
ADC2_IN
Text Label 6750 2250 3    60   ~ 0
ADC3_IN
Wire Wire Line
	9150 1050 9000 1050
Wire Wire Line
	9150 950  9000 950 
Wire Wire Line
	9000 850  9150 850 
Text Label 9000 1050 2    60   ~ 0
ADC3_IN
Text Label 9000 950  2    60   ~ 0
ADC2_IN
Text Label 9000 850  2    60   ~ 0
ADC1_IN
$Comp
L R R8
U 1 1 512165E8
P 7500 850
F 0 "R8" V 7580 850 50  0000 C CNN
F 1 "100" V 7500 850 50  0000 C CNN
	1    7500 850 
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 512165F7
P 7500 1550
F 0 "R9" V 7580 1550 50  0000 C CNN
F 1 "100" V 7500 1550 50  0000 C CNN
	1    7500 1550
	0    -1   -1   0   
$EndComp
$Comp
L R R10
U 1 1 51216606
P 7500 2250
F 0 "R10" V 7580 2250 50  0000 C CNN
F 1 "100" V 7500 2250 50  0000 C CNN
	1    7500 2250
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D2
U 1 1 51216624
P 7750 1050
F 0 "D2" H 7750 1150 50  0000 C CNN
F 1 "1.8V" H 7750 950 40  0000 C CNN
	1    7750 1050
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D3
U 1 1 51216633
P 7750 1750
F 0 "D3" H 7750 1850 50  0000 C CNN
F 1 "1.8V" H 7750 1650 40  0000 C CNN
	1    7750 1750
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D4
U 1 1 51216642
P 7750 2450
F 0 "D4" H 7750 2550 50  0000 C CNN
F 1 "1.8V" H 7750 2350 40  0000 C CNN
	1    7750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 1250 7750 1350
Wire Wire Line
	7750 1350 7250 1350
Wire Wire Line
	7750 1950 7750 2050
Wire Wire Line
	7750 2050 7250 2050
Wire Wire Line
	7750 2650 7750 2750
Wire Wire Line
	7750 2750 7250 2750
Text Label 6750 850  3    60   ~ 0
ADC1_IN
Text Label 7750 850  0    60   ~ 0
ADC1_OUT
Text Label 7750 1550 0    60   ~ 0
ADC2_OUT
Text Label 7750 2250 0    60   ~ 0
ADC3_OUT
Text Label 10100 850  0    60   ~ 0
ADC1_OUT
Text Label 10100 950  0    60   ~ 0
ADC2_OUT
Text Label 10100 1050 0    60   ~ 0
ADC3_OUT
Wire Wire Line
	9950 850  10100 850 
Wire Wire Line
	10100 950  9950 950 
Wire Wire Line
	9950 1050 10100 1050
Wire Wire Line
	5750 2550 5750 3050
Connection ~ 5750 2850
Connection ~ 5750 2650
Connection ~ 5750 2750
Wire Wire Line
	4950 2550 4950 2950
Connection ~ 4950 2650
Connection ~ 4950 2750
Connection ~ 4950 2850
$Comp
L GND #PWR031
U 1 1 51217604
P 5750 3050
F 0 "#PWR031" H 5750 3050 30  0001 C CNN
F 1 "GND" H 5750 2980 30  0001 C CNN
	1    5750 3050
	1    0    0    -1  
$EndComp
Connection ~ 5750 2950
$Comp
L +3.3V #PWR032
U 1 1 5121768F
P 4950 2550
F 0 "#PWR032" H 4950 2510 30  0001 C CNN
F 1 "+3.3V" H 4950 2660 30  0000 C CNN
	1    4950 2550
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP2
U 1 1 512176BC
P 5300 1500
F 0 "JP2" H 5300 1650 60  0000 C CNN
F 1 "BEAGLE_IN_5V" H 5300 1420 40  0000 C CNN
	1    5300 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 512176D0
P 5600 1650
F 0 "#PWR033" H 5600 1650 30  0001 C CNN
F 1 "GND" H 5600 1580 30  0001 C CNN
	1    5600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1500 5600 1650
$Comp
L +5V #PWR034
U 1 1 51217766
P 5000 1500
F 0 "#PWR034" H 5000 1590 20  0001 C CNN
F 1 "+5V" H 5000 1590 30  0000 C CNN
	1    5000 1500
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K2
U 1 1 5121A7CB
P 6750 4950
F 0 "K2" V 6700 4950 50  0000 C CNN
F 1 "Puente_h2" V 6800 4950 40  0000 C CNN
	1    6750 4950
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K1
U 1 1 5121A7DA
P 6750 5400
F 0 "K1" V 6700 5400 50  0000 C CNN
F 1 "Puente_h1" V 6800 5400 40  0000 C CNN
	1    6750 5400
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP3
U 1 1 5121B1E4
P 2250 2300
F 0 "JP3" H 2250 2450 60  0000 C CNN
F 1 "SERVO_IN" H 2250 2220 40  0000 C CNN
	1    2250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2300 2550 2300
Connection ~ 2700 2100
Wire Wire Line
	1950 1500 1950 2300
Wire Wire Line
	1700 1500 1950 1500
Wire Wire Line
	1700 1700 1700 1950
$Comp
L CONN_1 P8
U 1 1 5122E7FA
P 1950 800
F 0 "P8" H 2030 800 40  0000 L CNN
F 1 "CONN_1" H 1950 855 30  0001 C CNN
	1    1950 800 
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P7
U 1 1 5122E809
P 2450 800
F 0 "P7" H 2530 800 40  0000 L CNN
F 1 "CONN_1" H 2450 855 30  0001 C CNN
	1    2450 800 
	1    0    0    -1  
$EndComp
$EndSCHEMATC