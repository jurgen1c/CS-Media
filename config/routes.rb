Rails.application.routes.draw do
  root 'types#index'
  devise_for :users
  resources :articles do
    resources :votes, only: [:create, :destroy]
    resources :sources
    resources :reviews
    resources :comments, only: [:create, :destroy]
  end
  get '/search', to: 'types#search'
  resources :types, only: [:show]
  resources :users
  resources :followings, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
