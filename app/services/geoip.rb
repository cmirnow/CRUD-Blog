class Geoip
  def self.get_country_by_ip(x)
    x.gsub(/\s+/, '') if x.present?
  end

=begin
  def self.remote_ip(ip)
    if ip == '127.0.0.1'
      '8.8.8.8'
    else
      ip
    end
  end

  def self.country(ip)
    url = 'https://www.iplocate.io/api/lookup/' + remote_ip(ip) # + '?apikey=your_api_key'
    JSON.parse(Net::HTTP.get(URI.parse(url)))['country']
  end
=end
end
