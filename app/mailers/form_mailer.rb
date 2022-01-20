class FormMailer < ApplicationMailer
  def new_form_email(x)
    @form = x
    mail(to: ENV['SEND_EMAIL_TO'], subject: ENV['SUBJECT_EMAIL'])
  end
end
