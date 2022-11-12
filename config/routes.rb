Rails.application.routes.draw do
  
 
  resources :pollies
  resources :maps
  resources :places
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Blazer::Engine, at: "blazer"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
# post '/quote', to: 'quotes#create'

root 'pages#index'



get '/commercial', to: 'pages#commercial'

get '/quotes', to: 'pages#quotes'
# get 'pages/quotes'
get '/residential', to: 'pages#residential'
resources :leads
resources :quotes
get '/index', to: 'pages#index'

get '/map', to: 'admin#map'

resources :maps

end

