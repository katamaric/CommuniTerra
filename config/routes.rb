Rails.application.routes.draw do
  resources :cart_listings
  resources :order_listings
  resources :orders
  resources :carts

  namespace :admin do
      resources :users
      resources :allotments
      resources :deliveries
      resources :listings
      resources :owned_plants
      resources :plants
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
  get '/notre_equipe', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/faq', to: 'static_pages#faq'
  get '/mentions_legales', to: 'static_pages#mentions'
  get '/notre_histoire', to: 'static_pages#historic'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  resources :my_listings
  resources :plant_moods
  resources :deliveries
  resources :listings, path: 'marche'
  resources :allotment_users
  resources :allotments, path: 'potagers'
  resources :plant_sittings, path: 'gardiennage'
  resources :plant_sittings do
    get 'index_current_user', on: :collection
  end
  resources :kept_plants
  delete 'kept_plants/delete', to: 'kept_plants#delete', as: 'delete_kept_plants'
  resources :owned_plants
  resources :plants, path: 'plantes'
  resources :plants, only: [:show] do
    resources :plantimgs, only: [:create]
  end  
  resources :users
  resources :owned_plants do
    resources :log_books, except: [:show]
  end
  
end