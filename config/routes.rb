Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users
  resources :notes
  resources :likes,      only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]

  root "notes#index"
end
