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
                  keywords: 'blog, ruby on rails, web analytics, geo-targeted banner ads',
                  description: 'Your Guide To Content Management System For Ruby on Rails'
  end
end
