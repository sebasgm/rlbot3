# Import PyBBIO library:
from bbio import *

# Create a setup function:
def setup():
  # Set the GPIO pins:
  pinMode(USR3, OUTPUT)
  pinMode(GPIO1_6, INPUT)   # CLIF SENSOR

  # Set Sharp Distance Sensor 

  # PWM setup
  pinMode(GPIO1_15, OUTPUT) # IN PWM L
  pinMode(GPIO0_27, OUTPUT) # IN PWM L
  pinMode(GPIO1_30, OUTPUT) # IN PWM R
  pinMode(GPIO1_4, OUTPUT)  # IN PWM R
 
  pwmFrequency(PWM2B, 40000)
  pwmFrequency(PWM2A, 40000)

  pwmWrite(PWM2B, 305, resolution=512)
  pwmWrite(PWM2A, 290, resolution=512)

  pwmEnable(PWM2B)       # PWM L
  pwmEnable(PWM2A)       # PWM R

# Create a main function:
def loop():
  state = digitalRead(GPIO1_6)
  digitalWrite(USR3, state)
  delay(50)
 
  distance_read = analogRead(AIN0)
  print "ADC value: %i" % distance_read

    
  if state == LOW:  
    pwmWrite(PWM2B, 305, resolution=512)
    pwmWrite(PWM2A, 290, resolution=512)

    digitalWrite(GPIO1_15, LOW)
    digitalWrite(GPIO0_27, HIGH)
    digitalWrite(GPIO1_30, HIGH)
    digitalWrite(GPIO1_4, LOW)

    if distance_read >= 1600:

      pwmWrite(PWM2B, 295, resolution=512)
      pwmWrite(PWM2A, 305, resolution=512)
  
      digitalWrite(GPIO1_15, HIGH)
      digitalWrite(GPIO1_30, LOW)
      digitalWrite(GPIO0_27, LOW)
      digitalWrite(GPIO1_4, HIGH)

  else:	
    digitalWrite(GPIO1_15, LOW)
    digitalWrite(GPIO1_30, LOW)
    digitalWrite(GPIO0_27, LOW)
    digitalWrite(GPIO1_4, LOW)

# Start the loop:
run(setup, loop)

