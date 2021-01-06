class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @object = Post.published.first(5)
    banner
    metatags
    @coord = coord
    weather(coord[0], coord[1])
  end

  def coord
    [current_visit.latitude, current_visit.longitude]
  end

  def weather(*args)
    @obj = Openweathermap.current_weather_data(*args)
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha
      respond_to do |format|
        if @contact.save
          FormMailer.with(form: @contact).new_form_email.deliver_later
          format.js   { flash.now[:success] = 'Thank you for your message.' }
        else
          format.js { flash.now[:error] = see_errors(@contact) }
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
