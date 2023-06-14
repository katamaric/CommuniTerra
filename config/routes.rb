Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :allotments
      resources :allotment_users
      resources :deliveries
      resources :kept_plants
      resources :listings
      resources :log_books
      resources :owned_plants
      resources :plants
      resources :plant_moods
      resources :plant_sittings

      root to: "users#index"
    end
  get 'dashboard/index'
  resources :plant_moods
  resources :deliveries
  resources :listings
  resources :allotment_users
  resources :allotments
  devise_for :users, controllers: { registrations: 'users/registrations' }

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
