Rails.application.routes.draw do

  root "users#index"

  resources :users

  resource :session, :only => [:new, :create, :destroy]
  resources :schools, only: [:index, :show]

  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

end
