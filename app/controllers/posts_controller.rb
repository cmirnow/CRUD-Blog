class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    articles
    banner
    #@current_visit = current_visit
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
    x = country
    @result = '/images/' + GetImages.get_country(x) + '/' + GetImages.get_random_banner(x)
  end

  def country
    current_visit.country
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
