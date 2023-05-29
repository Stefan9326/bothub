Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :robots do
    member do
      get :availability
    end
  end

  resources :bookings, only: [:index, :create]

  resources :users, only: [] do
    resources :rentals, only: [:index]
  end
end
