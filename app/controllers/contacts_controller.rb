class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @articles = Post.first(10)
    check
    banner
    metatags
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha
      respond_to do |format|
        if @contact.save
          FormMailer.with(form: @contact).new_form_email.deliver_later
          format.html { redirect_to controller: 'contacts', action: 'index' }
          flash[:notice] = 'Thank you, your email has been sent.'
        end
      end
    end
  end

  def check
    @check = 1 if BuildHtml.params_check(params[:id], @post) || { controller: 'contacts', action: 'index' }
  end

  def banner
    @result = GetImages.banner(country)
  end

  def country
    current_visit&.country
  end

  def metatags
    set_meta_tags title: 'Contacts',
                  keywords: 'blog, ruby on rails, web analytics, geo-targeted banner ads',
                  description: 'Your Guide To Content Management System For Ruby on Rails'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
