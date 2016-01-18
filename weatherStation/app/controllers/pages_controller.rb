load '/home/pi/Documents/coding/raspberryPI/weatherStation/app/data_reader.rb'
load '/home/pi/Documents/coding/raspberryPI/weatherStation/app/weatherstation.rb'
class PagesController < ApplicationController
  def home
    `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
    server = WeatherMan.new
    $outside_data = server.getWeather(4219934)
    $sensor_temp = DRead.read_data('/home/pi/Documents/coding/raspberryPI/weatherStation/app/data.txt', 'temperature')
  end
end
