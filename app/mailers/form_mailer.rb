class FormMailer < ApplicationMailer
  def new_form_email
    @form = params[:form]
    mail(to: ENV['SEND_EMAIL_TO'], subject: ENV['SUBJECT_EMAIL'])
  end
end
