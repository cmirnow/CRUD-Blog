module SlideshowsHelper
  def slideshow_present?
    @slideshow&.images&.attached?
  end

  def path_to_file(x)
    Rails.application.routes.url_helpers.rails_blob_path(x, only_path: true)
  end

  def show_slider?
    current_page?(root_path) && slider_present?
  end

  def slider_dark
    Slider.published.take.dark
  end

  def slider_interval
    Slider.published.take.interval || 5000
  end

  def carousel_fade?
    'carousel-fade' if Slider.published.take.fade == true
  end
end
