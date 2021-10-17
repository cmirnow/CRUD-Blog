class SlideshowsController < ApplicationController
  def index
    @slideshow = Slideshow.published.find_by(id: 1)
    @object = Post.published.first(4)
    banner
  end
end
