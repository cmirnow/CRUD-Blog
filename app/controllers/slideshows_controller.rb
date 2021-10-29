class SlideshowsController < ApplicationController
  def index
    @slideshow = slideshow
    # @options = options
    @object = object
    banner
    metatags
    options
  end

  def slideshow
    Slideshow.published.take
  end

  def options
    @options = proc {
      $SAFE = 1
      eval(Slideshow.take.options) if slideshow
    }.call
  end

  def object
    Post.published.first(4)
  end
end
