ActiveAdmin.register Comment do
  permit_params :commenter, :body, :post_id

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_comment_path(comment), method: :put unless comment.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_comment_path(comment), method: :put if comment.published_at?
  end

  member_action :publish, method: :put do
    comment = Comment.find(params[:id])
    comment.update(published_at: Time.zone.now)
    redirect_to admin_comment_path(comment)
  end

  member_action :unpublish, method: :put do
    comment = Comment.find(params[:id])
    comment.update(published_at: nil)
    redirect_to admin_comment_path(comment)
  end

  form do |f|
    f.inputs 'Comment' do
      f.input :post
      f.input :commenter
      f.input :body
    end
    f.actions
  end
  show do |_t|
    attributes_table do
      row :post
      row :commenter
      row :body
      row :created_at
      row :updated_at
      row :published_at
    end
  end
end
