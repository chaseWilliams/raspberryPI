load File.expand_path("../../data_reader.rb", __FILE__)
load File.expand_path("../../weatherstation.rb", __FILE__)
class PagesController < ApplicationController
  def home
    `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
    server = WeatherMan.new
    @outside_data = server.getWeather(4219934)
    @sensor_temp = DRead.read_data('/home/pi/Documents/coding/raspberryPI/weatherStation/app/data.txt', 'temperature')
    @sensor_temp = (@sensor_temp.to_f * (9.0/5) + 32).round(2)
  end
end
