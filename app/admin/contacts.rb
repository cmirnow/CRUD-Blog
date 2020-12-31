ActiveAdmin.register Contact do
  permit_params :name, :email, :subject, :message
  remove_filter :subject
end
