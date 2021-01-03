class CategoriesController < ApplicationController
  def show
    posts
    banner
    @category = category
  end

  def index
    @categories = Category.published
    banner
  end

  def posts
    @articles = Post.published.map.select { |p| p.category_id == category.id }
  end

  def category
    Category.published.friendly.find(params[:id])
  end
end
