Rails.application.routes.draw do

  resources :users

  resources :foods

  resources :matches

  resources :messages

  resources :sessions

  root 'application#index'
end
