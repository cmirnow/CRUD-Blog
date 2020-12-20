ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :text, :tag_list, :image, :published_at

  scope :all
  scope :published
  scope :unpublished

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_post_path(post), method: :put unless post.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_post_path(post), method: :put if post.published_at?
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
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # ActiveAdmin article form conf:
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
      f.input :image, as: :file
    end
    f.actions
  end
  show do
    attributes_table do
      row :image do |ad|
        image_tag url_for(ad.image), class: 'image_preview' if ad.image.present?
      end
      row :title
      row :created_at
      row :updated_at
      row :published_at
      row :slug
    end
  end
end
