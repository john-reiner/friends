Rails.application.routes.draw do
  resources :users
  resources :pages
  resources :posts do 
    resources :comments
  end
  resources :sessions, only: [:new, :create]

  get "/logout", to: "sessions#destroy"
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#show"
end
