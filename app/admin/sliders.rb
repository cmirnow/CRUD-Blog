ActiveAdmin.register Slider do
  index do
    selectable_column
    id_column
    column :name
    column :published_at
    column :created_at
    column :updated_at
    column :interval
    column :dark
    column :fade
    column :color
    actions
  end

  permit_params :published_at, :name, :captions, :color, :interval, :dark, :fade, images: []
  remove_filter :images_attachments, :images_blobs, :captions, :color, :interval, :dark, :fade

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_slider_path(slider), method: :put unless slider.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_slider_path(slider), method: :put if slider.published_at?
  end

  action_item :delete_images, only: :show do
    link_to 'Delete Images', delete_images_admin_slider_path(slider), method: :delete if slider.images.attached?
  end

  member_action :publish, method: :put do
    slider = Slider.find(params[:id])
    slider.update(published_at: Time.zone.now)
    redirect_to admin_slider_path(slider)
  end

  member_action :unpublish, method: :put do
    slider = Slider.find(params[:id])
    slider.update(published_at: nil)
    redirect_to admin_slider_path(slider)
  end

  member_action :delete_images, method: :delete do
    slider = Slider.find(params[:id])
    # asset = ActiveStorage::Attachment.find_by(params[:attachment_id])
    slider.images.purge_later
    redirect_to admin_slider_path(slider)
  end

  member_action :delete_image, method: :delete do
    slider = Slider.find_by(params[:name])
    slider.images[params[:id].to_i].purge_later
    redirect_to admin_slider_path(slider)
  end

  form do |f|
    f.inputs 'Slider' do
      f.input :fade, as: :boolean, label: 'carousel-fade'
      f.input :name
      f.input :captions
      f.input :color, label: 'Captions color'
      f.input :interval, input_html: { value: f.object.interval || 5000 }
      f.input :dark, input_html: { value: f.object.dark || 0.2 }
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  show do |t|
    attributes_table do
      if t.images.attached?
        t.images.each_with_index do |img, index|
          span do
            link_to delete_image_admin_slider_path(index), method: :delete do
              image_tag img.variant(resize_to_limit: [100, 100])
            end
          end
        end
      end
      row :name
      row :created_at
      row :updated_at
      row :published_at
      row :fade
    end
    para 'Click the preview to delete the image.'
  end
end
