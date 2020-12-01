Rails.application.routes.draw do
  get 'tags/show'
  get 'analytics/index'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :tags, only: [:index, :show]
  root 'posts#index'
  resources :posts do
      resources :comments
end
end
