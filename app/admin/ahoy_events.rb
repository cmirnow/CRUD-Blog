ActiveAdmin.register Ahoy::Event do
  permit_params :visit_id, :user_id, :name, :properties, :time
  remove_filter :visit, :name
  actions :all, except: [:new, :edit]
end
