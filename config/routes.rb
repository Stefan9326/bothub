Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"


  get 'bookings/form', to: 'bookings#form'


  delete '/delete_booking/:id', to: 'bookings#destroy', as: :booking_destroy

  resources :robots do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:index, :show, :edit, :update]

  get "robots/my_robots", to: "robots#my_robots"

  get 'my_robots', to: 'robots#my_robots'

  get '/my_bookings', to: 'robots#my_bookings'

  resources :reviews, only: [:create, :destroy]
end
