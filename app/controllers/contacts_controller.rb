class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha
      respond_to do |format|
        if @contact.save
          FormMailer.with(form: @contact).new_form_email.deliver_later
          format.html { redirect_to contacts_url }
          flash.notice = 'Thank you, your email has been sent.'
        end
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
