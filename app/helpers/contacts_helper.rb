module ContactsHelper

  def show_map?
    !current_visit.latitude.nil?
  end

end
