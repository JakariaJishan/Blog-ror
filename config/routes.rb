Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only:[:index, :show] do
    resources :posts , only: [:index, :show, :destroy]
  end

  # resources :posts
  get "/posts/new", to: 'posts#new'
  post "/posts", to: 'posts#create'
  post "/users/:user_id/posts/:id/add_like", to: 'likes#add_like'
  post "/users/:user_id/posts/:id/add_comment", to: 'comments#add_comment'
  # post "/users/:user_id/posts/:id/destroy", to: 'posts#destroy'
  
end
