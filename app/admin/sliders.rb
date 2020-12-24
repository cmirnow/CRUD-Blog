ActiveAdmin.register Slider do
  permit_params :published_at, :name, images: []

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_slider_path(slider), method: :put unless slider.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_slider_path(slider), method: :put if slider.published_at?
  end

  action_item :delete_image, only: :show do
    link_to 'Delete Image', delete_image_admin_slider_path(slider), method: :delete if slider.images.attached?
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

  member_action :delete_image, method: :delete do
    slider = Slider.find(params[:id])
    asset = ActiveStorage::Attachment.find_by(params[:attachment_id])
    asset&.purge_later
    redirect_to admin_slider_path(slider)
  end

  form do |f|
    f.inputs 'Slider' do
      f.input :name
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
  show do |t|
    attributes_table do
      if t.images.attached?
        row 'images' do |m|
          m.images.each do |img|
            span do
              image_tag(img, class: 'img_preview')
            end
          end
        end
      end
      row :name
      row :created_at
      row :updated_at
      row :published_at
    end
  end
end
