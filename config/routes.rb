Rails.application.routes.draw do

  root "users#index"

  resources :users

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :bookmarks, only: [:create, :destroy]

end
