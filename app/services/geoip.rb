class Geoip
  def self.remote_ip(ip)
    if ip == '127.0.0.1'
      '93.185.29.95'
    else
      ip
    end
  end

  def self.get_country_by_ip(ip)
    url = 'https://www.iplocate.io/api/lookup/' + remote_ip(ip) # + '?apikey=your_api_key'
    response = Net::HTTP.get(URI.parse(url))
    JSON.parse(response)['country'].gsub(/\s+/, '')
  end
end
