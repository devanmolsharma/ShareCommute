Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/login" => "users#login"
  get "/plan" => "plans#index"
  get "/register" => "users#register"
  get "/" => "rides#index"
  get "/page/:page" => "rides#index"
  get "/ride/:ride_id" => "rides#view"
  get "/rides/find/:query" => "rides#find"
  get "/rides/find/cat/:cat/:query" => "rides#find"
  get "/rides/find/cat/:cat/" => "rides#find"
  get "/plan/finalise" => "plans#finalise"
  get "/order_success" => "plans#order_success"
  post "/auth" => "users#authenticate"
  post "/new" => "users#create"
  get "/logout" => "users#logout"
  post "/addToCart" => "rides#addToPlan"
  get "/plan/remove/:id" => "plans#remove"
  get "/past_orders" => "plans#past_orders"
  get "/plan/change/:id/seats/:seats" => "plans#changeSeats"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
