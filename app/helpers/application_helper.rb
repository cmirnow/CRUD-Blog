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
      current_page?(controller: 'slideshows') ||
      current_page?(controller: 'analytics')
  end

  def scroll_up
    unless current_page?(controller: 'contacts')
      button_tag type: 'button', class: 'btn btn-light back-to-top', id: 'btn-back-to-top' do
        content_tag(:i, '', class: 'fa-solid fa-arrow-up')
      end
    end
  end

  def button_one
    link_to 'To the Main', root_path, class: btn unless current_page?(root_path)
  end

  def button_two
    link_to 'Categories', categories_path, class: btn if Category.published.present? &&
                                                         !current_page?(controller: 'categories')
  end

  def btn
    'btn btn-light float-end'
  end

  def show_map?
    current_page?(controller: 'contacts') if @obj
  end

  def categories?
    current_page?(controller: 'categories', action: 'show')
  end

  def menu(i)
    tag.li class: 'nav-item' do
      link_to i.title, { controller: 'posts', action: 'show', id: i.slug }, class: 'nav-link px-lg-3 py-3 py-lg-4'
    end
  end

  def contacts
    tag.li class: 'nav-item' do
      link_to 'Contacts', { controller: 'contacts' }, class: 'nav-link px-lg-3 py-3 py-lg-4'
    end
  end

  def analytics
    tag.li class: 'nav-item' do
      link_to 'Analytics', { controller: 'analytics' }, class: 'nav-link px-lg-3 py-3 py-lg-4'
    end
  end

  def slideshow
    tag.li class: 'nav-item' do
      link_to 'Slideshow', { controller: 'slideshows' }, class: 'nav-link px-lg-3 py-3 py-lg-4'
    end
  end

  def pagination
    paginate @object
  end

  def greeting
    Date.today.strftime('%d of %B %Y, %A')
  end
end
