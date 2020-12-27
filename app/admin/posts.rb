ActiveAdmin.register Post do
  permit_params :title, :text, :tag_list, :published_at, images: []

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_post_path(post), method: :put unless post.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_post_path(post), method: :put if post.published_at?
  end

  action_item :delete_images, only: :show do
    link_to 'Delete Images', delete_images_admin_post_path(post), method: :delete if post.images.attached?
  end

  member_action :publish, method: :put do
    post = Post.friendly.find(params[:id])
    post.update(published_at: Time.zone.now)
    redirect_to admin_post_path(post)
  end

  member_action :unpublish, method: :put do
    post = Post.friendly.find(params[:id])
    post.update(published_at: nil)
    redirect_to admin_post_path(post)
  end

  member_action :delete_images, method: :delete do
    post = Post.friendly.find(params[:id])
    # asset = ActiveStorage::Attachment.find_by(params[:attachment_id])
    post.images.purge_later
    redirect_to admin_post_path(post)
  end

  form do |f|
    f.inputs 'Article' do
      f.input :tag_list, input_html: { value: f.object.tag_list.join(', ') }, label: 'Tags (separated by commas)'.html_safe
      f.input :title
      f.input :text, as: :quill_editor, input_html: { data:
        { options:
          { modules:
            { toolbar:
              [%w[bold italic underline strike],
               %w[blockquote code-block],
               [{ 'list': 'ordered' }, { 'list': 'bullet' }],
               [{ 'align': [] }],
               ['link'],
               [{ 'size': ['small', false, 'large', 'huge'] }],
               [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
               [{ 'indent': '-1' }, { 'indent': '+1' }],
               [{ 'direction': 'rtl' }],
               [{ 'color': [] }, { 'background': [] }],
               [{ 'font': [] }],
               ['clean'],
               ['image'],
               ['video']] },
            theme: 'snow' } } }
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
      row :title
      row :created_at
      row :updated_at
      row :published_at
      row :slug
    end
  end
end
