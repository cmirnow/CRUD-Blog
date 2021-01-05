module PostsHelper
  def slider_present?
    @slider&.images&.attached?
  end

  def post_title_link(i)
    link_to controller: :posts, action: :show, id: i.slug do
      tag.H2 class: 'post-title' do
        i.title
      end
    end
  end
  
end
