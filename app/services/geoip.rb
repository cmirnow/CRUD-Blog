class Geoip
  def self.remote_ip(ip)
    if ip == '127.0.0.1'
      '77.111.245.11'
    else
      ip
    end
  end

  def self.get_country_by_ip(ip)
    t = country(ip)
    t.gsub(/\s+/, '') if t.present?
  end

  def self.country(ip)
    url = 'https://www.iplocate.io/api/lookup/' + remote_ip(ip) # + '?apikey=your_api_key'
    JSON.parse(Net::HTTP.get(URI.parse(url)))['country']
  end
end
