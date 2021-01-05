module CategoriesHelper
  def preview_c(i)
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
end
