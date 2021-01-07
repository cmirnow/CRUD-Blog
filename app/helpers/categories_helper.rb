module CategoriesHelper
  def preview_category(i)
    if i.image.attached?
      tag.div class: 'preview' do
        link_to i.image, 'data-lightbox' => 'preview' do
          image_tag i.image.variant(
            combine_options:
            { resize_to_fill: [400, 300], monochrome: true }
          )
        end
      end
    end
  end

  def category_title_link(i)
    link_to controller: 'categories', action: 'show', id: i.friendly_id do
      tag.h2 class: 'post-title' do
        i.title
      end
    end
  end
end
