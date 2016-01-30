load File.expand_path("../../data_reader.rb", __FILE__)
load File.expand_path("../../weatherstation.rb", __FILE__)
class PagesController < ApplicationController
 before_action :establishing


   private
   def establishing
      server = WeatherMan.new(4219934)
      @outside_data   = server.getWeather(4219934)
      @sensor_temp    = DRead.read_data(File.expand_path('../../data.txt', __FILE__), 'temperature')
      @sensor_temp    = (@sensor_temp.to_f * (9.0/5) + 32).round
      @outside_data.compact
      @background_img = server.getImg @outside_data[:temp]
   end
  def home
   # `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
  end
end
