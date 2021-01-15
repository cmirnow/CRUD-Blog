class CommentsController < ApplicationController
  def create
    @post = Post.friendly.find(params[:post_id])
    if verify_recaptcha
      @comment = @post.comments.create(comment_params)
      respond_to do |format|
        if @comment.save
          CommentMailer.with(comment: @comment, post: @post).new_comment_email.deliver_later
          format.js   { flash.now[:warning] = 'Your comment will be published after moderation.' }
        else
          format.js { flash.now[:error] = see_errors(@comment) }
        end
      end
    end
  end

  def see_errors(x)
    if x.errors.any?
      view_context.pluralize(x.errors.count, 'error').to_s +
        ' prohibited this call from being send: ' +
        x.errors.full_messages.map { |i| %('#{i}') }.join(',')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
