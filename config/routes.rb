Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "robots/my_robots", to: "robots#my_robots"
  resources :robots
end
