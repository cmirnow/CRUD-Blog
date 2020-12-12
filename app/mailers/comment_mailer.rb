class CommentMailer < ApplicationMailer
  def new_comment_email
    @comment = params[:comment]
    mail(to: ENV['SEND_EMAIL_TO'], subject: ENV['SUBJECT_COMMENT_EMAIL'])
  end
end