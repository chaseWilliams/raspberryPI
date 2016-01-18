require 'rest-client'

class WeatherMan
  @current = Hash.new
  def getWeather(cityID)
    response = JSON.parse RestClient.get "http://api.openweathermap.org/data/2.5/weather?id=#{cityID}&APPID=bd43836512d5650838d83c93c4412774"
    @current = {
      temp: (1.8 * (response['main']['temp'].to_f - 273) + 32).round(2),
      cloudiness: response['clouds']['all'].to_f.round,
      humidity: response['main']['humidity'].to_f.round
    }
    return @current
  end
  
end
