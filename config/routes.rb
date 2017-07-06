Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :notes
  resources :likes,      only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]

  root "notes#index"
end
