module ArchiveHelper
  def preview(i)
    if i.images.attached? && !current_page?(root_path)
      tag.div class: 'preview' do
        link_to i.images.first, 'data-lightbox' => 'preview' do
          image_tag i.images.first.variant(
            combine_options:
            { resize_to_fill: [400, 300], kuwahara: '3%' }
          )
        end
      end
    end
  end
end
