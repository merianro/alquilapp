Rails.application.routes.draw do
  get 'main/home',   to: 'home#main'
  devise_for :users, controllers: { :registrations  => "users/registrations", :sessions  => "users/sessions" }
  
  get 'cars', to: 'cars#index'
  post 'cars', to: 'cars#index'

  get 'cars/habilitar', to: 'cars#habilitar'
  post 'cars/habilitar', to: 'cars#habilitar'

  get 'users/habilitar', to: 'users#habilitar'
  post 'users/habilitar', to: 'users#habilitar'

  get 'cars/new', to: 'cars#new'
  post 'cars/new', to: 'cars#new'

  get 'cars/create', to: 'cars#create'
  post 'cars/create', to: 'cars#create'


  post '/validations/:id/edit', to: 'validations#edit'

  get 'users/create_su', to: 'users#create_su'
  post 'users/create_su', to: 'users#create_su'

  get 'cars/:id', to: 'cars#show'
  post 'cars/:id', to: 'cars#show'
  
  get 'users/edit_su', to: 'users#edit_su'
  post 'users/edit_su', to: 'users#edit_su'

  get 'users/suindex', to: 'users#suindex'
  post 'users/suindex', to: 'users#suindex'

  get 'estadisticas/index7', to: 'estadisticas#index7'
  post 'estadisticas/index7', to: 'estadisticas#index7'

  get 'estadisticas/index30', to: 'estadisticas#index30'
  post 'estadisticas/index30', to: 'estadisticas#index30'
  
  
  get 'users/drindex', to: 'users#drindex'
  post 'users/drindex', to: 'users#drindex'
  
  post '/cars/:id/edit', to: 'cars#edit'
  
  
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
  
  get 'validations/desasignar', to: 'validations#desasignar'
  post 'validations/desasignar', to: 'validations#desasignar'
  
  get 'validations/validate', to: 'validations#validate'
  post 'validations/validate', to: 'validations#validate'
  
  get 'sistema_reportes/new', to: 'sistema_reportes#new'
  post 'sistema_reportes/new', to: 'sistema_reportes#new'
  
  get 'sistema_reportes/atender', to: 'sistema_reportes#atender'
  post 'sistema_reportes/atender', to: 'sistema_reportes#atender'
  
  get 'sistema_reportes/desatender', to: 'sistema_reportes#desatender'
  post 'sistema_reportes/desatender', to: 'sistema_reportes#desatender'
  
  get 'sistema_reportes/finalizar', to: 'sistema_reportes#finalizar'
  post 'sistema_reportes/finalizar', to: 'sistema_reportes#finalizar'
  
  get 'sistema_reportes/finalizar_aplicar_multa/:id', to: 'sistema_reportes#finalizar_aplicar_multa'
  post 'sistema_reportes/finalizar_aplicar_multa/:id', to: 'sistema_reportes#finalizar_aplicar_multa'
  patch 'sistema_reportes/finalizar_aplicar_multa/:id', to: 'sistema_reportes#finalizar_aplicar_multa'
  
  get 'sistema_reportes/finalizar_multa', to: 'sistema_reportes#finalizar_multa'
  post 'sistema_reportes/finalizar_multa', to: 'sistema_reportes#finalizar_multa'
  
  post 'alquilers/:id/edit', to: 'alquilers#edit'
  
  get 'users/update_password', to: 'users#update_password'
  post 'users/update_password', to: 'users#update_password'
  
  get 'users/actualizar_contrasena', to: 'users#actualizar_contrasena'
  post 'users/actualizar_contrasena', to: 'users#actualizar_contrasena'
  patch 'users/actualizar_contrasena', to: 'users#actualizar_contrasena'
  
  
  get 'users/update_details', to: 'users#update_details'
  post 'users/update_details', to: 'users#update_details'
  patch 'users/update_details', to: 'users#update_details'
  
  get 'users/update_location', to: 'users#update_location'
  post 'users/update_location', to: 'users#update_location'
  patch 'users/update_location', to: 'users#update_location'
  
  get 'alquilers/new', to: 'alquilers#new'
  post 'alquilers/new', to: 'alquilers#new'

  get 'alquilers/dejar_auto', to: 'alquilers#dejar_auto'
  post 'alquilers/dejar_auto', to: 'alquilers#dejar_auto'

  get 'parametros/:id/edit', to: 'parametros#edit'
  post 'parametros/:id/edit', to: 'parametros#edit'
  patch 'parametros/:id/edit', to: 'parametros#edit'
  
  resources :users
  resources :validations
  resources :cars
  resources :mercado_pagos
  resources :mp_webhooks
  resources :sistema_reportes
  resources :alquilers
  resources :estadisticas
  resources :messages 
  resources :parametros

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  
  authenticated :user do
    root "cars#home2", as: :authenticated_root
  end
  
  root "main#home"
  
  
end