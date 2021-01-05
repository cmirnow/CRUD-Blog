ActiveAdmin.register Category do
  permit_params :name, :description, :published_at, :slug, :image
  remove_filter :slug

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_category_path(category), method: :put unless category.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_category_path(category), method: :put if category.published_at?
  end

  action_item :delete_image, only: :show do
    link_to 'Remove Image', delete_image_admin_category_path(category), method: :delete if category.image.attached?
  end

  member_action :publish, method: :put do
    category = Category.friendly.find(params[:id])
    category.update(published_at: Time.zone.now)
    redirect_to admin_category_path(category)
  end

  member_action :unpublish, method: :put do
    category = Category.friendly.find(params[:id])
    category.update(published_at: nil)
    redirect_to admin_category_path(category)
  end

  member_action :delete_image, method: :delete do
    category = Category.friendly.find(params[:id])
    category.image.purge_later
    redirect_to admin_category_path(category)
  end

  form do |f|
    f.inputs 'Category' do
      f.input :name
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end
  show do |t|
    attributes_table do
      if t.image.attached?
        span do
          image_tag t.image.variant(resize_to_limit: [300, 400])
        end
      end
      row :name
      row :description
      row :created_at
      row :updated_at
      row :published_at
      row :slug
    end
  end
end
