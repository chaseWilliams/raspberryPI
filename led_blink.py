import RPi.GPIO as GPIO
import time, random

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

blue_led = 12
red_led = 17
green_led = 13
button = 18

GPIO.setup(blue_led, GPIO.OUT)
GPIO.setup(red_led, GPIO.OUT)
GPIO.setup(green_led, GPIO.OUT)
GPIO.setup(button, GPIO.IN, GPIO.PUD_UP)

while True:
    if !(GPIO.input(button)):
        x = 2
        print("Enjoy!")
        while x > 0:
            GPIO.output(blue_led, 1)
            time.sleep(1)
            GPIO.output(blue_led, 0)
            GPIO.output(green_led, 1)
            time.sleep(1)
            GPIO.output(green_led, 0)
            GPIO.output(red_led, 1)
            time.sleep(1)
            GPIO.output(red_led, 0)
            x = x - 1
        print("Done.")
        break

GPIO.cleanup()
