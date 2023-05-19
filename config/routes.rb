Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only:[:index, :show] do
    resources :posts , only: [:index, :show]
  end

  # resources :posts
  get "/posts/new", to: 'posts#new'
  post "/posts", to: 'posts#create'
end
