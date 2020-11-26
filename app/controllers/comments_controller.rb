class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if verify_recaptcha
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
    flash.notice = 'You have added a comment!'
    else
    redirect_to post_path(@post)
  end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    flash.notice = 'You have destroy a comment!'
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end