Rails.application.routes.draw do



  root "users#index"

  resources :users do 
    resources :reviews, :only => [:index, :show]
  end

  resources :schools do 
    resources :reviews
  end

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "sessions#new"
  delete "logout" => "sessions#destroy"

  resources :bookmarks, only: [:create, :destroy]

end
