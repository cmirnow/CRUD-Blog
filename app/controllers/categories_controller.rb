class CategoriesController < ApplicationController
  def show
    posts
    banner
    @presenter = CategoryPresenter.new(category)
    @page_title = @presenter.title
    @page_description = @presenter.description
  end

  def index
    @object = Category.published.order(created_at: :asc).page(params[:page])
    banner
    metatags
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
