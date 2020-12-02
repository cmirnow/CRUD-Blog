class FeedsController < ApplicationController
  layout false

  def rss
    @posts = Post.all
  end
end