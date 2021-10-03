class PostsController < ApplicationController
  def show
    @post = post
    @presenter = PostPresenter.new(post)
    @page_description = @presenter.description
    @page_keywords = @presenter.keywords
    articles
    banner
  end

  def index
    banner
    metatags
    articles
    slider
  end

  def post
    Post.published.friendly.find(params[:id])
  end

  def articles
    @object = Post.published.order(created_at: :asc).page(params[:page])
  end

  def slider
    # @slider = Slider.published.find_by_name('slider_one')
    @slider = Slider.published.take
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
