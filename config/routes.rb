Rails.application.routes.draw do

  post 'users/match', to: 'users#get_a_match'
  get 'users/profile', to: 'users#profile'
  resources :users

  resources :foods

  resources :matches

  resources :messages

  get  'login', to: 'sessions#new',    as: 'login'
  post 'login', to: 'sessions#create', as: 'create_session'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'application#index'
end
