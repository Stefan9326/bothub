Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "robots/my_robots", to: "robots#my_robots"
  resources :robots

  get 'robots/search', to: 'robots#search'

  get 'my_robots', to: 'robots#my_robots'
end
