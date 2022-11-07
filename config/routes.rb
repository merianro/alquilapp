Rails.application.routes.draw do
  resources :validations
  resources :cars
  resources :mercado_pagos
  resources :mp_webhooks
  get 'main/home', to: 'home#main'
  devise_for :users

  
  get 'users/suindex', to: 'users#suindex'
  post 'users/suindex', to: 'users#suindex'

  get 'users/drindex', to: 'users#drindex'
  post 'users/drindex', to: 'users#drindex'
  
  post '/cars/:id/edit', to: 'cars#edit'
  post '/cars/new', to: 'cars#new'
  
  post '/users/:id/edit', to: 'users#edit'
  post '/users/new', to: 'users#new'

  get 'users/anadir_saldo', to: 'users#anadir_saldo'
  post 'users/anadir_saldo', to: 'users#anadir_saldo'
  
  
  get 'users/newsu', to: 'users#newsu'
  post 'users/newsu', to: 'users#newsu'
  
  get 'mp_webhooks', to: 'mp_webhooks#index'
  post "mp_webhooks", to: "mp_webhooks#create"

  get 'users/cmngsoon', to: 'users#cmngsoon'
  post 'users/cmngsoon', to: 'users#comngsoon'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  authenticated :user do
    root "cars#home", as: :authenticated_root
  end
  
  root "main#home"
  
  
end