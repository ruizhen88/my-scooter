Rails.application.routes.draw do
  root to: 'pages#home'
  # get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :scooters
  # post '/users/:user_id/scooters/:scooter_id/bookings/', to: 'bookings#create', as: 'bookings'

  get '/my_scooters', to: 'pages#my_scooters'
  resources :scooters do
    resources :bookings
    resources :reviews, only: [ :index ]
  end


  resources :users do
    resources :bookings, only: [ :index, :show ] do
      resources :reviews, only: [ :new, :create ]
    end
  end


  resources :conversations do
    resources :messages
  end

  resources :bookings, only: [:show]
end
