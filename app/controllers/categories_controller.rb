class CategoriesController < ApplicationController
  def show
    posts
    banner
  end

  def index
    @categories = Category.published
    banner
  end

  def posts
    @articles = Post.published.map.select { |p| p.category_id == Category.published.friendly.find(params[:id]).id }
  end
end
