class CategoriesController < ApplicationController
  def show
    posts
    banner
    @category = category
  end

  def index
    @object = Category.published.order(created_at: :asc).page(params[:page])
    banner
  end

  def posts
    @object = Kaminari.paginate_array(
      Post.published.order(created_at: :desc).map.select { |p| p.category_id == category.id }
    ).page(params[:page])
  end

  def category
    Category.published.friendly.find(params[:id])
  end
end
