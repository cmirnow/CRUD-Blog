ActiveAdmin.register Category do
  permit_params :name, :description, :published_at, :slug
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

  form do |f|
    f.inputs 'Category' do
      f.input :name
      f.input :description
    end
    f.actions
  end
end
