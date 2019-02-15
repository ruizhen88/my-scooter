Rails.application.routes.draw do
  root to: 'pages#home'
  # get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :scooters
  post '/users/:user_id/scooters/:scooter_id/bookings/', to: 'bookings#create', as: 'bookings'
  resources :users do
    resources :scooters do
      resources :bookings
    end
    resources :bookings, only: [ :index, :show ]
  end
end
