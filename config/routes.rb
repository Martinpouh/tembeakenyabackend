Rails.application.routes.draw do
  resources :passenger_schedules, only: [:index, :show, :create, :destroy]
  resources :schedules
  resources :passenger_flights
  resources :flights
  resources :passengers, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/hello", to: "application#hello_world"

  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  get "/me", to: "passengers#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/flightsbooked", to: "flights#flightsbooked"
end
