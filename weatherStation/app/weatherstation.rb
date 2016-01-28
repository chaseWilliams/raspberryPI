require 'rest-client'

class WeatherMan
  response = Hash.new
  #images within accessible data structures, designed to be expandable
  @hot = ['https://farm2.staticflickr.com/1515/23959664094_9c59962bb0_b.jpg']
  def getWeather(cityID)
    response = JSON.parse RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=#{cityID}&APPID=bd43836512d5650838d83c93c4412774&units=Imperial"
    return {
      temp: response['main']['temp'].to_f.round,
      cloudiness: response['clouds']['all'].to_f.round,
      humidity: response['main']['humidity'].to_f.round,
      windiness: response['wind']['speed'],
      condition_id: response['weather'][0]['id'].to_f,
      condition_name: response['weather'][0]['main'],
      condition_description: response['weather'][0]['description'],
      condition_img: response['weather'][0]['icon']
    }
  end
  
  def getImg(temp)
    if temp <= 100 #CHANGE!!!
      return @hot[rand(@hot.size)]
    elsif  temp <= 32
      return nil
    elsif temp <= 50
      return nil
    elsif  temp <= 75
      return nil
    elsif  temp <= 105
     return nil
   end
  end
end
