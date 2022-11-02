Rails.application.routes.draw do
  resources :validations
  resources :cars
  resources :mercado_pagos
  resources :mp_webhooks
  get 'main/home'
  devise_for :users

  get 'users/suindex', to: 'users#suindex'
  post 'users/suindex', to: 'users#suindex'

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
  root "cars#home"
  # root "validations#index"

end
