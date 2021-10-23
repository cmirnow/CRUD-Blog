class SlideshowsController < ApplicationController
  def index
    @slideshow = Slideshow.published.take
    @object = Post.published.first(4)
    banner
    metatags
  end
end
