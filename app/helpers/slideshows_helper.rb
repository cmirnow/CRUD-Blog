module SlideshowsHelper
  def slideshow_present?
    @slideshow&.images&.attached?
  end

  def path_to_file(x)
    Rails.application.routes.url_helpers.rails_blob_path(x, only_path: true)
  end
end
