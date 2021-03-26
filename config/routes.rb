Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  get 'static/home'
  get 'static/about'
  get 'static/contact'

  resources :cars
  resources :customers
  resources :invoices
  resources :orders
  resources :stops
  resources :users

  get 'generate_invoice/show'

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', as: :logout

  root to: 'static#home'
end
