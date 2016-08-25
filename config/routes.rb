Rails.application.routes.draw do



  root "users#index"

  resources :users do 
    resources :reviews, :only => [:index, :show]
  end

  resources :schools do 
    resources :reviews
    resources :bookmarks, only: [:create, :update, :destroy]
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :schools, only: [:index, :show]
  resource :comparisions, :only => [:index]

  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"


end
