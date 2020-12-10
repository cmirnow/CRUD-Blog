class PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])
    articles
    banner
    @updated_on = 'Updated on ' + @post.updated_at.to_s if @post.updated_at != @post.created_at
    metatags
    check
  end

  def index
    #@all_ids = Post.ids
    banner
    metatags
    articles
  end

  def check
    @check = 1 if BuildHtml.params_check(params[:id], @post) || { controller: 'contacts', action: 'index' }
  end

  def metatags
    set_meta_tags title: 'How to Build a Blog with Ruby on Rails',
                  keywords: 'blog, ruby on rails, web analytics, geo-targeted banner ads',
                  description: 'Your Guide To Content Management System For Ruby on Rails'
  end

  def articles
    @articles = Post.first(10)
  end

  def banner
    @result = GetImages.banner(country)
  end

  def country
    current_visit&.country
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
