require 'rest-client'

class WeatherMan
  #images within accessible data structures, designed to be expandable

  def initialize(cityID)
    @hot = ['https://farm2.staticflickr.com/1515/23959664094_9c59962bb0_b.jpg']
    @rain = ['https://farm8.staticflickr.com/7062/6845995798_37c20b1b55_h.jpg']
    @time_since_check = Time.now
    @response = JSON.parse RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=#{cityID}&APPID=bd43836512d5650838d83c93c4412774&units=Imperial"
  end
  def getWeather(cityID)
    if @time_since_check + 600 > Time.now
      @response = JSON.parse RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=#{cityID}&APPID=bd43836512d5650838d83c93c4412774&units=Imperial"
      return {
        temp: @response['main']['temp'].to_f.round,
        cloudiness: @response['clouds']['all'].to_f.round,
        humidity: @response['main']['humidity'].to_f.round,
        windiness: @response['wind']['speed'],
        condition_id: @response['weather'][0]['id'].to_f,
        condition_name: @response['weather'][0]['main'],
        condition_description: @response['weather'][0]['description'],
        condition_img: @response['weather'][0]['icon']
      }
    end
  end

  def getImg(temp)
    if temp <= 400 #CHANGE!!!
      return @rain[rand(@rain.length)]
    elsif  temp <= 32 
    temp <= 50
      return nil
    elsif  temp <= 75
      return nil
    elsif  temp <= 105
     return nil
    end
  end
end
