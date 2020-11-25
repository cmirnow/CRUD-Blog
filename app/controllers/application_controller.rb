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
end
