module PostsHelper
  def slider_present?
    @slider&.images&.attached?
  end
end
