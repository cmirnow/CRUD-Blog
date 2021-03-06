module PostsHelper
  def slider_present?
    @slider&.images&.attached?
  end

  def preview_post(i)
    if i.images.attached? && !current_page?(root_path)
      tag.div class: 'preview' do
        link_to i.images.first, 'data-lightbox' => 'preview' do
          image_tag i.images.first.variant(
            resize_to_fill: [400, 300], kuwahara: '3%'
          )
        end
      end
    end
  end

  def post_title_link(i)
    link_to controller: 'posts', action: :show, id: i.slug do
      tag.h2 class: 'post-title' do
        i.title
      end
    end
  end

  def posts_list(i)
    concat preview_post(i)
    tag.div class: 'post-preview' do
      concat post_title_link(i)
      concat content_tag(:p, 'Posted on ' + i.created_at.to_s, class: 'post-meta')
    end
  end

  def tags(tag)
    link_to (tag.to_s +
      ' (' +
      Post.tagged_with(tag).count.to_s +
      ')'),
            tag_url(tag),
            class: 'badge badge-secondary'
  end
end
