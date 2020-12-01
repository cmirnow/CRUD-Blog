class GetImages
  def self.get_image_paths(d)
    Dir.children(File.join(Rails.root, d))
  end

  def self.get_random_banner(country)
    get_image_paths('/public/images/' + get_country(country)).sample
  end

  def self.get_country(country)
    if %w[GB US RU NL].include? country
      country
    else
      'other'
    end
  end

  def self.banner(x)
    '/images/' + get_country(x) + '/' + GetImages.get_random_banner(x)
  end
end
