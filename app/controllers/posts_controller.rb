class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    articles
    banner
  end

  def index
    @all_ids = Post.ids
    articles
    banner
  end

  def articles
    @articles = Post.first(10)
  end

  def banner
    @result = '/images/' + GetImages.get_country(country) + '/' + GetImages.get_random_banner(country)
  end

  def country
    Geoip.get_country_by_ip(request.remote_ip)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
