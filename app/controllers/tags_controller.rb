class TagsController < ApplicationController
  def show
    banner
    articles
  end

  def articles
    @articles = Post.published.tagged_with(params[:id])
  end
end
