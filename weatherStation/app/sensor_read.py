#!/usr/bin/python

import Adafruit_DHT
# Adafruit_DHT.DHT22, or Adafruit_DHT.AM2302.
sensor = Adafruit_DHT.AM2302

pin = 4

# Try to grab a sensor reading.  Use the read_retry method which will retry up
# to 15 times to get a sensor reading (waiting 2 seconds between each retry).
humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
if humidity is None or temperature is None:
    humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
fo = open('data.txt', 'w')
fo.write("temperature={0}\nhumidity={1}".format(temperature, humidity))
fo.close()
