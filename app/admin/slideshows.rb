ActiveAdmin.register Slideshow do
  permit_params :published_at, :name, :options, images: []
  remove_filter :images_attachments, :images_blobs, :options

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_slideshow_path(slideshow), method: :put unless slideshow.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_slideshow_path(slideshow), method: :put if slideshow.published_at?
  end

  action_item :delete_images, only: :show do
    if slideshow.images.attached?
      link_to 'Delete Images', delete_images_admin_slideshow_path(slideshow), method: :delete
    end
  end

  member_action :publish, method: :put do
    slideshow = Slideshow.find(params[:id])
    slideshow.update(published_at: Time.zone.now)
    redirect_to admin_slideshow_path(slideshow)
  end

  member_action :unpublish, method: :put do
    slideshow = Slideshow.find(params[:id])
    slideshow.update(published_at: nil)
    redirect_to admin_slideshow_path(slideshow)
  end

  member_action :delete_images, method: :delete do
    slideshow = Slideshow.find(params[:id])
    # asset = ActiveStorage::Attachment.find_by(params[:attachment_id])
    slideshow.images.purge_later
    redirect_to admin_slideshow_path(slideshow)
  end

  member_action :delete_image, method: :delete do
    slideshow = Slideshow.find_by(params[:name])
    slideshow.images[params[:id].to_i].purge_later
    redirect_to admin_slideshow_path(slideshow)
  end

  form do |f|
    f.inputs 'Slideshow' do
      f.input :name
      f.input :options,
              input_html: { value: f.object.options || '{ "resize_to_limit": [300, 222], "kuwahara": "3%", "quality": 15 }' },
              label: 'Options. For example: { "resize_to_limit": [300, 222], "monochrome": true }'
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  show do |t|
    attributes_table do
      if t.images.attached?
        t.images.each_with_index do |img, index|
          span do
            link_to delete_image_admin_slideshow_path(index), method: :delete do
              image_tag img.variant(resize_to_limit: [100, 100])
            end
          end
        end
      end
      row :name
      row :created_at
      row :updated_at
      row :published_at
    end
    para 'Click the preview to delete the image.'
  end
end
