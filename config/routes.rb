Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :users
  resources :followings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
