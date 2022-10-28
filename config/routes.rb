Rails.application.routes.draw do
  resources :cars
  get 'main/home'
  devise_for :users

  get 'users/suindex', to: 'users#suindex'
  post 'users/suindex', to: 'users#suindex'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#home"


 

end
