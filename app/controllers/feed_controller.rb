class FeedController < ApplicationController
  layout false

  def rss
    @posts = Post.all
  end
end
