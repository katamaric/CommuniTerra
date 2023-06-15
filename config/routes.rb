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

  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard_index'

  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: "static_pages#home"
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'static_pages/home'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/faq', to: 'static_pages#faq'
  get '/mentions_legales', to: 'static_pages#mentions'
  get '/histoire', to: 'static_pages#historic'


  resources :plant_moods
  resources :deliveries
  resources :listings
  resources :allotment_users
  resources :allotments
  resources :plant_sittings do
    get 'index_current_user', on: :collection
  end
  resources :kept_plants
  resources :owned_plants
  resources :plants
  resources :users

  resources :owned_plants do
    resources :log_books
  end
  
end