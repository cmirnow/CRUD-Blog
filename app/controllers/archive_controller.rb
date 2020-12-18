class ArchiveController < ApplicationController
  def index
    articles
    banner
  end

  def articles
    @articles = Post.published.order(created_at: :desc).page(params[:page])
  end
end
