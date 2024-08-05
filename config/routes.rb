Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resouces :airlines, only [:show]
  resources :flights, only: [:index] 
  resources :passenger_flights, only: [:destroy] 
end
