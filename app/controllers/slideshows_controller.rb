class SlideshowsController < ApplicationController
  def index
    @slideshow = slideshow
    @object = object
    banner
    metatags
    metatags_og
    metatags_twitter
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
