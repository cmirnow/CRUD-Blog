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
    link_to image_tag("up-arrow.png"), "#", {id: 'back-to-top', class: 'back-to-top', role: 'button'}
  end
end
