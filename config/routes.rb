Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :robots do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:destroy, :index, :show]
  get "robots/my_robots", to: "robots#my_robots"

  get 'my_robots', to: 'robots#my_robots'

  get '/my_bookings', to: 'robots#my_bookings'

  resources :reviews, only: [:create, :destroy]
end
