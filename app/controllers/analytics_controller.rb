class AnalyticsController < ApplicationController
  def index
    @browsers = Ahoy::Visit.all.group(:browser).count.map { |k, v| [k ||= 'undefined', v] }
    @locations = Ahoy::Visit.all.group(:country).count.map { |k, v| [k ||= 'undefined', v] }
    @cities = Ahoy::Visit.all.group(:city).count.map { |k, v| [k ||= 'undefined', v] }
    @devices = Ahoy::Visit.all.group(:device_type).count.map { |k, v| [k ||= 'undefined', v] }
    @object = Post.published.first(4)
    @current_visit = current_visit
    metatags
    banner
  end
end
