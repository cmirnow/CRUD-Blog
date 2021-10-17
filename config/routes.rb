Rails.application.routes.draw do
  get 'contacts/index'
  post 'contacts/index'
  get 'feed.rss', controller: 'feeds', action: 'rss', format: 'rss'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tags, only: [:show]
  root 'posts#index'
  resources :posts do
    resources :comments
  end
  resources :contacts
  resources :categories, only: %i[index show]
  resources :analytics, only: [:index]
  resources :slideshows, only: [:index], path: :slideshow
end
