ActiveAdmin.register ActsAsTaggableOn::Tag, as: 'Tag' do
  permit_params :name
  remove_filter :taggings
end 
