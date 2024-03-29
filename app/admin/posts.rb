ActiveAdmin.register Post do
  index do
    selectable_column
    column :id
    column :title
    column :keywords
    column :description
    column :category
    column :slug
    column :tag_list
    column :created_at
    column :updated_at
    column :published_at
    actions
  end

  permit_params :title, :text, :tag_list, :published_at, :category_id, :description, :keywords, images: []
  remove_filter :comments, :images_attachments, :images_blobs, :taggings, :tag_taggings, :base_tags, :slug

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
    post.images.purge_later
    redirect_to admin_post_path(post)
  end

  form do |f|
    f.inputs 'Article' do
      f.input :category
      f.input :tag_list, input_html: { value: f.object.tag_list.join(', ') }, label: 'Tags (separated by commas)'
      f.input :title, label: 'Title (70 characters maximum)'
      f.input :description, label: 'Description (160 characters maximum)'
      f.input :keywords, label: 'Keywords (5 - 10 words)'
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
            theme: 'snow' } } }, label: 'The content of the article'
      f.input :images, as: :file, input_html: { multiple: true }, label: 'Add illustrations to the article'
    end
    f.actions
  end
  show do |t|
    attributes_table do
      if t.images.attached?
        t.images.each do |img|
          span do
            image_tag img.variant(resize_to_limit: [100, 100])
          end
        end
      end
      row :title
      row :created_at
      row :updated_at
      row :published_at
      row :slug
      row :category
    end
  end
end
