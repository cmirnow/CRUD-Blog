ActiveAdmin.register Contact, as: "Message" do
  permit_params :name, :email, :subject, :message
  remove_filter :subject
  actions :all, except: [:new]
end
