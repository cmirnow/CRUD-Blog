ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :text
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
               ['image']] },
            theme: 'snow' } } }
      # f.input :published
    end
    f.actions
  end
end
