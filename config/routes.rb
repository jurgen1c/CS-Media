Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users
  resources :articles do
    resources :votes
    resources :sources
    resources :reviews
    resources :comments
  end
  resources :users
  resources :followings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
