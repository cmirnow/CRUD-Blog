class PostsController < ApplicationController
  def show
    @post = Post.published.friendly.find(params[:id])
    articles
    banner
    @updated_on = 'Updated on ' + @post.updated_at.to_s if @post.updated_at != @post.created_at
    metatags
  end

  def index
    # @all_ids = Post.ids
    banner
    metatags
    articles
    slider
  end

  def metatags
    set_meta_tags title: 'How to Build a Blog with Ruby on Rails',
                  keywords: 'blog, ruby on rails, web analytics, geo-targeted banner ads',
                  description: 'Your Guide To Content Management System For Ruby on Rails'
  end

  def articles
    @articles = Post.published.first(5)
  end

  def slider
    # @slider = Slider.published.find_by_name('slider_one')
    @slider = Slider.published.first
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
