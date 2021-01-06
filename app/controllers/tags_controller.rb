class TagsController < ApplicationController
  def show
    banner
    articles
  end

  def articles
    @object = Kaminari.paginate_array(Post.published.tagged_with(params[:id])).page(params[:page])
  end
end
