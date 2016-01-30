load File.expand_path("../../data_reader.rb", __FILE__)
load File.expand_path("../../weatherstation.rb", __FILE__)
class PagesController < ApplicationController
 before_action :establishing


   private
   def establishing
      @outside_data   = WeatherMan.getWeather 4219934
      @sensor_data    = {
        temp: DRead.read_data(File.expand_path('../../data.txt', __FILE__), 'temperature'),
        humidity: DRead.read_data(File.expand_path('../../data.txt', __FILE__), 'humidity').to_f.round
      }
      @sensor_data[:temp]    = (@sensor_data[:temp].to_f * (9.0/5) + 32).round
      @background_img = ISource.getImg @outside_data[:temp]
   end
  def home
   # `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
  end
end
