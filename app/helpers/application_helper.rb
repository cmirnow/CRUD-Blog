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
      link_to 'Older Posts', { controller: :archive }, class: 'btn btn-light float-right'
    elsif current_page?(controller: 'archive')
      link_to 'To the Main', { controller: :posts }, class: 'btn btn-light float-right'
    end
  end
end
