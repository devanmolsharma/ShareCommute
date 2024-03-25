Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/login' => 'users#login'
  get '/' => 'rides#index'
  get '/ride/:ride_id' => 'rides#view'
  get '/rides/find/:query' => 'rides#find'
  get '/rides/find/:cat/:query' => 'rides#find'
  post '/auth' => 'users#authenticate'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
