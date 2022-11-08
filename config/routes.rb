Rails.application.routes.draw do
  get 'main/home',   to: 'home#main'
  devise_for :users, controllers: { registrations: "users/registrations" }

  get 'users/create_su', to: 'users#create_su'
  post 'users/create_su', to: 'users#create_su'

    
  
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
    
  get 'mp_webhooks/create', to: 'mp_webhooks#create'

  get 'users/cmngsoon', to: 'users#cmngsoon'
  post 'users/cmngsoon', to: 'users#comngsoon'
  
  get 'validations/new', to: 'validations#new'
  post 'validations/new', to: 'validations#new'
  
  get 'validations/asignarse', to: 'validations#asignarse'
  post 'validations/asignarse', to: 'validations#asignarse'
  
  resources :users
  resources :validations
  resources :cars
  resources :mercado_pagos
  resources :mp_webhooks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  
  authenticated :user do
    root "cars#home", as: :authenticated_root
  end
  
  root "main#home"
  
  
end