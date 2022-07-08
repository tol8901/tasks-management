Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/workers', to: 'workers#index'
  resources :workers, only: %i[index show]
  resources :tickets, only: %i[index show]
end
