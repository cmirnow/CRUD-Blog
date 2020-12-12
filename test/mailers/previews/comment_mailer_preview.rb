# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  def new_comment_email
    # Set up a temporary order for the preview
    comment = Comment.new(commenter: "Vasya Pupkin", body: "Hello my friend.")

    CommentMailer.with(comment: comment).new_comment_email
  end
end