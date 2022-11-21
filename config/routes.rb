Rails.application.routes.draw do
  resources :buildings
  resources :interventions
  resources :pollies
  get 'get_buildings_by_customer_id/:customer_id', to: 'interventions#get_buildings_by_customer_id'  
  get '/building_search' => 'buildings#building_search'
  resources :vsers

  resources :maps
  resources :places

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Blazer::Engine, at: "blazer"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


# post '/quote', to: 'quotes#create'
post '/lead', to: 'leads#create'

  
  root 'pages#index'





  get '/commercial', to: 'pages#commercial'

  
  get '/residential', to: 'pages#residential'
  resources :leads
  resources :quotes
  get '/index', to: 'pages#index'

  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

get '/map', to: 'admin#map'

resources :maps

end

