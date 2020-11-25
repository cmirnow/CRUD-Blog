class AnalyticsController < ApplicationController
	before_action :authenticate_user!
  def index
    @visits = Ahoy::Visit.all
    @events = Ahoy::Event.all
    #@events = Ahoy::Event.where_properties(title: params[:token])
    #@events = Ahoy::Event.group("time::date").select("time::date as date, count(1) as count").map{|k| [k.date, k.count]}
    #@index_visits =  Ahoy::Event.all.where(name: "Viewed Index").group_by_hour(:time).count
    @browsers = Ahoy::Visit.all.group(:browser).count
    @locations = Ahoy::Visit.all.group(:country).count
  end
end
