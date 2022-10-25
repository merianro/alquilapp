Rails.application.routes.draw do
  get 'main/home'
  devise_for :sus
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :sus
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#home"
end
