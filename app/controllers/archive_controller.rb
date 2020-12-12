class ArchiveController < ApplicationController
  def index
    articles
    banner
  end

  def articles
    @articles = Post.last(1)
  end
end
