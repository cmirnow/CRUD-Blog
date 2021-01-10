class AnalyticsController < ApplicationController
  def index
    @browsers = Ahoy::Visit.all.group(:browser).count.map { |k, v| [k ||= 'undefined', v] }
    @locations = Ahoy::Visit.all.group(:country).count
    @cities = Ahoy::Visit.all.group(:city).count
    @devices = Ahoy::Visit.all.group(:device_type).count.map { |k, v| [k ||= 'undefined', v] }
    banner
    @object = Post.published.first(5)
  end
end
