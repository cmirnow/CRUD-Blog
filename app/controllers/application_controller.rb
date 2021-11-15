class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action
  after_action :track_event

  protected

  def track_action
    ahoy.track 'New action', request.path_parameters
  end

  def track_event
    ahoy.track 'New event', request.path_parameters
  end

  def banner
    @banner = GetImages.get_random_banner(country)
  end

  def country
    current_visit&.country
  end

  def metatags
    set_meta_tags title: 'Building a Blog with Ruby on Rails',
                  description: 'Your Guide To Content Management System For Ruby on Rails'
  end

  def metatags_og
    set_meta_tags og: {
      title: @presenter&.post_title || 'Building a Blog with Ruby on Rails',
      type: 'article',
      url: request.original_url,
      description: @presenter&.description || 'Your Guide To Content Management System For Ruby on Rails',
      image: image
    }
  end

  def metatags_twitter
    set_meta_tags twitter: {
      card: 'summary',
      site: '@mastercot'
    }
  end

  def image
    request.base_url +
      if @presenter&.post&.images&.attached?
        Rails.application.routes.url_helpers.rails_blob_path(@presenter.post.images.take, only_path: true)
      else
        ActionController::Base.helpers.image_url('blog_onrails.jpg')
      end
  end
end
