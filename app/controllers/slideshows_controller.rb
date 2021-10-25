class SlideshowsController < ApplicationController
  def index
    @slideshow = slideshow
    @options = options
    @object = object
    banner
    metatags
  end

  def slideshow
    Slideshow.published.take
  end

  def options
    eval(Slideshow.take.options) if slideshow
  end

  def object
    Post.published.first(4)
  end
end
