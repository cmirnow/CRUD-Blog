class TagsController < ApplicationController
  def show
    banner
    articles
    metatags
  end

  def articles
    @object = Kaminari.paginate_array(Post.published.tagged_with(params[:id])).page(params[:page])
  end
end
