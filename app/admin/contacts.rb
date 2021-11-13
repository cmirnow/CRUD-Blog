ActiveAdmin.register Contact, as: "Messages" do
  permit_params :name, :email, :subject, :message
  remove_filter :subject
  actions :all, except: [:new]
end
