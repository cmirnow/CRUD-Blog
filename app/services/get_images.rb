class GetImages
  def self.get_random_banner(country)
    x = get_country(country)
    File.join('/images', x, Dir.children(File.join(File.join(Rails.root, 'public', 'images'), x)).sample)
  end

  def self.get_country(country)
    if %w[GB US RU NL].include? country
      country
    else
      'other'
    end
  end
end
