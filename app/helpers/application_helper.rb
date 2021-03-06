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
      current_page?(controller: 'contacts') ||
      current_page?(controller: 'analytics')
  end

  def scroll_up
    link_to image_tag('up-arrow.png'), '#', { id: 'back-to-top', class: 'back-to-top', role: 'button' }
  end

  def button_one
    link_to 'To the Main', root_path, class: btn, data: { turbolinks: 'false' } unless current_page?(root_path)
  end

  def button_two
    link_to 'Categories', categories_path, class: btn if Category.published.present? &&
                                                         !current_page?(controller: 'categories')
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

  def menu(i)
    tag.li class: 'nav-item' do
      link_to i.title, { controller: 'posts', action: 'show', id: i.slug }, class: 'nav-link'
    end
  end

  def contacts
    tag.li class: 'nav-item' do
      link_to 'Contacts', { controller: 'contacts' }, class: 'nav-link'
    end
  end

  def analytics
    tag.li class: 'nav-item' do
      link_to 'Analytics', { controller: 'analytics' }, class: 'nav-link', data: { turbolinks: false }
    end
  end

  def pagination
    paginate @object
  end

  def greeting
    Date.today.strftime('%d of %B %Y, %A')
  end
end
