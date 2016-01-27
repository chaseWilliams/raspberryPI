require 'rest-client'

class WeatherMan
  response = Hash.new
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
end
