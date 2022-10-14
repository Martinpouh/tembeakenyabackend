Rails.application.routes.draw do
  resources :passengers
  resources :passenger_schedules
  resources :passenger_flights
  resources :flights
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
