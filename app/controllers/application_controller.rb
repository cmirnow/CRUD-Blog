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
end
