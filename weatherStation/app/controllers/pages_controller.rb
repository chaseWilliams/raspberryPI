load File.expand_path("../../data_reader.rb", __FILE__)
load File.expand_path("../../weatherstation.rb", __FILE__)

#this is the primary CONTROLLER of this rails application. controls data suppliance to UI
class PagesController < ApplicationController
 before_action :establishing
 def home
   #lights up LED when http request is received
   `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/led_blink.py`
   #refreshes the contents of the data file.
   `sudo python /home/pi/Documents/coding/raspberryPI/weatherStation/app/sensor_read.py`
 end
  private
  def establishing #sets up all the variables for the view
    @outside_data   = WeatherMan.getWeather 4219934
    @sensor_data    = {
      temp: DRead.read_data(File.expand_path('../../data.txt', __FILE__), 'temperature'),
      humidity: DRead.read_data(File.expand_path('../../data.txt', __FILE__), 'humidity').to_f.round
    }
    @sensor_data[:temp]    = (@sensor_data[:temp].to_f * (9.0/5) + 32).round
    @background_img = ISource.getImg @outside_data[:temp]
  end

end
