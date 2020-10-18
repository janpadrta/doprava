Rails.application.routes.draw do
  resources :invoices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  get 'static/home'
  get 'static/about'
  get 'static/contact'

  resources :customers
  resources :orders
  resources :users

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', as: :logout

  root to: 'static#home'
end
