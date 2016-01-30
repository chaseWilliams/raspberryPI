require 'rest-client'
require File.expand_path('../dynamic_picture_acquisition.rb', __FILE__)
include Flickrd

module WeatherMan
  @time_since_check = Time.now
  @weather_data = JSON.parse RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=4219934&APPID=bd43836512d5650838d83c93c4412774"
  def getWeather(cityID)
    if true
      response = JSON.parse (RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=#{cityID}&APPID=bd43836512d5650838d83c93c4412774")
      @time_since_check = Time.now
      weather_data = {
        temp: (1.8*(response['main']['temp'].to_f-273)+32).round,
        cloudiness: response['clouds']['all'].to_f.round,
        humidity: response['main']['humidity'].to_f.round,
        windiness: response['wind']['speed'].to_f.round(1),
        condition_id: response['weather'][0]['id'].to_i,
        condition_name: response['weather'][0]['main'],
        condition_description: response['weather'][0]['description'],
        condition_img: response['weather'][0]['icon']
      }
      @weather_data = weather_data
      return weather_data
    end
  end
  module_function :getWeather
end

module ISource
  extend WeatherMan
  @cold = [23577541545]
  @fog = [8469962417, 14919486574]
  @snow = [89074472]
  @cool = [12043895515, 20342715613 ]
  @warm = [3704273935, 3780893961, 16021074821, 6357276861]
  @hot = [23959664094, 9557006394, 16391611278, 8248259072]
  @really_hot = [19656910812, 5951751285]
  @rain = [6845995798, 9615537120, 6133720797, 15274211811]
  def getImg(temp) #compares with weather condition codes
    if (WeatherMan.getWeather(4219934)[:condition_id] >= 200 && WeatherMan.getWeather(4219934)[:condition_id] < 600) #rain?
      return imgUrl @rain[rand(@rain.length)-1]
    elsif WeatherMan.getWeather(4219934)[:condition_id] >= 600 && WeatherMan.getWeather(4219934)[:condition_id] < 700 #snow?
      return imgUrl @snow[rand(@snow.length)-1]
    #elsif ([701, 721, 741].each {|k| k == WeatherMan.getWeather(4219934)[:condition_id]}) #fog?
      #return imgUrl @fog[rand(@fog.length)-1]
    elsif temp <= 10 #cold?
      return imgUrl @cold[rand(@cold.length)-1]
    elsif temp <= 40 #cool?
      return imgUrl @cool[rand(@cool.length)-1]
    elsif temp <= 75 #warm?
      return imgUrl @warm[rand(@warm.length)-1]
    elsif temp <= 100
      return imgUrl @hot[rand(@hot.length)-1]
    else #probably defaults to hot
      return imgUrl @really_hot[rand(@really_hot.length)-1]
    end
  end
  module_function :getImg
end
