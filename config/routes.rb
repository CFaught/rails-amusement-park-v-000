Rails.application.routes.draw do
  get 'rides/create'

  root "static#home"
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create', as: "session_create"
  post '/signout', to: 'sessions#destroy'

  post '/rides/new', to: 'rides#create', as: 'new_ride'
end
