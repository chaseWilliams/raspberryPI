import RPi.GPIO as GPIO
import time, random
#determines how pin placement is configured
GPIO.setmode(GPIO.BCM)
red_led = 18 #pin number (location)

GPIO.setup(red_led, GPIO.OUT) #configures pin for output
GPIO.output(red_led, 1)
time.sleep(3)
GPIO.output(red_led, 0)
GPIO.cleanup() #finishes and returns pin to normal state
