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
    @articles = Kaminari.paginate_array(
      Post.published.map.select { |p| p.category_id == category.id }
    ).page(params[:page])
  end

  def category
    Category.published.friendly.find(params[:id])
  end
end
