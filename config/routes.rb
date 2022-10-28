Rails.application.routes.draw do
  resources :cars
  resources :mercado_pago
  get 'main/home'
  devise_for :users

  get 'users/suindex', to: 'users#suindex'
  post 'users/suindex', to: 'users#suindex'

  get 'users/cmngsoon', to: 'users#cmngsoon'
  post 'users/cmngsoon', to: 'users#comngsoon'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#home"


 

end
