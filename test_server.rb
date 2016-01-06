require 'socket'
require './weatherstation.rb'

server = TCPServer.new('0.0.0.0', 2000)

loop do
  socket = server.accept
  request = socket.gets
  STDERR.puts request
  weather = WeatherMan.new
  curweather = weather.getWeather(4219934)
  response = "The temperature is #{curweather[:temp]} degrees Fahrenheit. It is #{curweather[:cloudiness]} percent cloudy " +
  "and #{curweather[:humidity]} percent humid. Enjoy!\n\nChase Williams"
  socket.print "HTTP/1.1 200 OK\r\n" +
             "Content-Type: text/plain\r\n" +
             "Content-Length: #{response.bytesize}\r\n" +
             "Connection: close\r\n"
  socket.print "\r\n"
  socket.print response
  socket.close
end
