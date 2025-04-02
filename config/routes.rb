Rails.application.routes.draw do
  resources :bounties
  resources :sessions, only: :create
  resources :users, only: %i[ create update edit destroy ]

  get "login" => "sessions#new", as: :login
  get "logout" => "sessions#destroy", as: :logout
  get "signup" => "users#new", as: :signup

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "geocoding" => "geocoding#show", as: :geocoding

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "welcome#show"
end
