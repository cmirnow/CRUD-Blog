class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @all_ids = Post.ids
    @rq = Post.first(10)
    banner
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
