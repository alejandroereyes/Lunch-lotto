Rails.application.routes.draw do

  resources :users

  resources :foods

  resources :matches

  resources :messages

  root 'application#index'
end
