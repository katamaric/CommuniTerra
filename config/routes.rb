Rails.application.routes.draw do
  resources :plant_moods
  resources :deliveries
  resources :listings
  resources :allotment_users
  resources :allotments
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :plant_sittings
  resources :kept_plants
  resources :owned_plants
  resources :plants
  get 'static_pages/home'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :owned_plants do
    resources :log_books
  end
  
  root to: "static_pages#home"
end
