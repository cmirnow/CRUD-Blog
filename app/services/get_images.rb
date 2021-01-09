class GetImages
  def self.get_random_banner(country)
    x = get_country(country)
    File.join('/images', x, Dir.children(File.join(Rails.root, 'public', 'images', x)).sample)
  end

  def self.get_country(country)
    if dir_names.include? country
      country
    else
      'other'
    end
  end

  def self.dir_names
    target_folder_path = File.join(Rails.root, 'public', 'images')
    Dir.children(target_folder_path)
  end
end
