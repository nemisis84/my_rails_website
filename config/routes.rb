Rails.application.routes.draw do
    root "articles#index"


    resources :articles do
        resources :comments
    end

    get "/login", to: "sessions#login"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
    post "/logout", to: "sessions#destroy"

    resources :users
    

    # get "/user/new", to: "user#new"


    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
