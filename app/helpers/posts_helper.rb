module PostsHelper
  def slider_present?
    @slider.present? && @slider.images.attached?
  end
end
