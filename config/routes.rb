Rails.application.routes.draw do
  get 'analytics/index'
  get 'feed.rss', controller: 'feed', action: 'rss', format: 'rss'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tags, only: [:show]
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
