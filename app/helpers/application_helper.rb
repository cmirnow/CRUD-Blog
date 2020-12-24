module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'warning'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def scroll_up
    link_to image_tag('up-arrow.png'), '#', { id: 'back-to-top', class: 'back-to-top', role: 'button' }
  end

  def buttons
    if current_page?(controller: 'posts')
      link_to 'All Articles', archive_index_path, class: btn
    elsif current_page?(archive_index_path) || current_page?(controller: 'tags', action: 'show')
      link_to 'To the Main', '/', class: btn, data: { turbolinks: 'false' }
    end
  end

  def btn
    'btn btn-light float-right'
  end

  def show_map?
    current_page?(controller: 'contacts') && !current_visit.latitude.nil?
  end

  def show_slider?
    current_page?('/')
  end
end
