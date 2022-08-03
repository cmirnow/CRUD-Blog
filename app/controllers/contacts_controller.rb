class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @object = Post.published.first(4)
    banner
    metatags
    metatags_og
    metatags_twitter
    @coord = coord
    weather(coord[0], coord[1])
  end

  def coord
    coord = [
      current_visit&.latitude,
      current_visit&.longitude
    ]
    if coord.compact.empty?
      ['48.864716', '2.349014'] # Paris, my love :)
    else
      coord
    end
  end

  def weather(*args)
    @obj = Openweathermap.current_weather_data(*args)
  rescue StandardError => e
    flash.now[:warning] = "Rescued: #{e.inspect}"
  end

  def create
    @contact = Contact.new(contact_params)
    if verify_recaptcha
      respond_to do |format|
        if @contact.save
          FormMailer.new_form_email(@contact).deliver_later
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

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
