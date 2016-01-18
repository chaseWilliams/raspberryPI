class PagesController < ApplicationController
  def home
    `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
  end
end
