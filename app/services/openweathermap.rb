class Openweathermap
  def self.current_weather_data(*args)
    uri = URI(url(*args))
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.url(*args)
    'http://api.openweathermap.org/data/2.5/weather?lat=' +
      args[0].to_s +
      '&lon=' +
      args[1].to_s +
      '&appid=' +
      ENV['KEY_OPENWEATHERMAP'] +
      '&units=metric'
  end
end
