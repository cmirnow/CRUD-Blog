class TagsController < ApplicationController
  def show
    banner
    @posts = Post.tagged_with(params[:id])
  end

  def banner
    x = country
    @result = '/images/' + GetImages.get_country(x) + '/' + GetImages.get_random_banner(x)
  end

  def country
    current_visit.country
  end
end
