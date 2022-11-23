Rails.application.routes.draw do
  devise_for :users
  # devise_for :admin_users, ActiveAdmin::Devise.config

  resources :buildings
  # resources :interventions
  get 'get_buildings_by_customer_id/:customer_id', to: 'interventions#get_buildings_by_customer_id'  
  get '/newinterventions', to: 'pages#new'
  post  '/interventions', to: 'interventions#create'
  get 'get_batteries_by_building_id/:building_id', to: "interventions#get_batteries_by_building_id"
  get 'get_columns_by_battery_id/:battery_id', to: "interventions#get_columns_by_battery_id"
  get 'get_elevators_by_column_id/:column_id', to: "interventions#get_elevators_by_column_id"
  resources :pollies
  get 'get_buildings_by_customer_id/:customer_id', to: 'interventions#get_buildings_by_customer_id'  
  # get '/building_search' => 'buildings#building_search'
  resources :vsers

  resources :maps
  resources :places

  ActiveAdmin.routes(self)
  mount Blazer::Engine, at: "blazer"

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

