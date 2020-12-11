class TagsController < ApplicationController
  def show
    banner
    @articles = Post.tagged_with(params[:id])
  end

  def banner
    @banner = GetImages.get_random_banner(country)
  end

  def country
    current_visit&.country
  end
end
