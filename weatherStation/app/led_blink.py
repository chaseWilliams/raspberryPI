import RPi.GPIO as GPIO
import time, random

GPIO.setmode(GPIO.BCM)
red_led = 18

GPIO.setup(red_led, GPIO.OUT)
GPIO.output(red_led, 1)
time.sleep(3)
GPIO.output(red_led, 0)
GPIO.cleanup()
