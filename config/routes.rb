Rails.application.routes.draw do

  post 'users/match', to: 'users#get_a_match'

  get 'profile', to: 'users#profile'

  resources :users

  resources :foods

  resources :matches

  resources :messages


  post 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'application#index'
end
