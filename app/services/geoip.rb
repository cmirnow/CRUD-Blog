class Geoip
  def self.remote_ip(ip)
    if ip == '127.0.0.1'
      '77.111.245.11'
    else
      ip
    end
  end

  def self.get_country_by_ip(ip)
    url = 'https://www.iplocate.io/api/lookup/' + remote_ip(ip) # + '?apikey=your_api_key'
    response = Net::HTTP.get(URI.parse(url))
    if JSON.parse(response)['country'].present?
    	JSON.parse(response)['country'].gsub(/\s+/, '')
    end
  end
end
