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

  def show_navigation?
    (controller.controller_name == 'posts' && controller.action_name == 'show') ||
      controller_name == 'contacts'
  end

  def scroll_up
    link_to image_tag('up-arrow.png'), '#', { id: 'back-to-top', class: 'back-to-top', role: 'button' }
  end

  def buttons
    if current_page?(controller: 'posts')
      link_to 'All Articles', archive_index_path, class: btn
    elsif current_page?(archive_index_path) ||
          current_page?(controller: 'tags', action: 'show', id: '1') ||
          current_page?(controller: 'categories')
      link_to 'To the Main', root_path, class: btn, data: { turbolinks: 'false' }
    end
  end

  def categories
    link_to 'Categories', categories_path, class: btn unless Category.published.blank?
  end

  def btn
    'btn btn-light float-right'
  end

  def show_map?
    current_page?(controller: 'contacts') && !current_visit.latitude.nil?
  end

  def show_slider?
    current_page?(root_path) && slider_present?
  end

  def categories?
    current_page?(controller: 'categories', action: 'show')
  end
end
