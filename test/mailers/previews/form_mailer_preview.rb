# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview
  def new_form_email
    # Set up a temporary order for the preview
    form = Contact.new(name: "Vasya Pupkin", email: "info@bluhbluhbluh.ru", subject: "niochem", message: "Hello my friend.")

    FormMailer.with(form: form).new_form_email
  end
end

