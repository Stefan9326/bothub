Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "robots/my_robots", to: "robots#my_robots"
  resources :robots do
    resources :bookings, only: [:index, :create, :destroy]
  end
end
