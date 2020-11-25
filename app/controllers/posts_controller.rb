class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @all_ids = Post.ids
    @rq = Post.first(10)
    banner
  end

  def analytics
    @all_ids = Post.ids
    @rq = Post.first(10)
    @visits = Ahoy::Visit.all
    @events = Ahoy::Event.all
    # @events = Ahoy::Event.where_properties(title: params[:token])
    # @events = Ahoy::Event.group("time::date").select("time::date as date, count(1) as count").map{|k| [k.date, k.count]}
    # @index_visits =  Ahoy::Event.all.where(name: "Viewed Index").group_by_hour(:time).count
    @browsers = Ahoy::Visit.all.group(:browser).count
    @locations = Ahoy::Visit.all.group(:country).count
  end

  def index
    @all_ids = Post.ids
    @rq = Post.first(4)
    banner
  end

  def banner
    country = Geoip.get_country_by_ip(request.remote_ip)
    @result = '/images/' + GetImages.get_country(country) + '/' + GetImages.get_random_banner(country)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
