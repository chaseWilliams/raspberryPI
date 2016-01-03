import RPi.GPIO as GPIO
import time, random

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

blue_led = #figure out
red_led =
green_led =
button =

GPIO.setup(blue_led, GPIO.OUT)
GPIO.setup(red_led), GPIO.OUT)
GPIO.setup(green_led, GPIO.OUT)
GPIO.setup(button, GPIO.IN, GPIO.PUD_UP)

while True:
    if GPIO.input(button) == False:
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
