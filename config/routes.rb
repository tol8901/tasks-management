Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/workers', to: 'workers#index'
  resources :workers, :except => [:new, :edit] do
    member do
      patch :activate
      patch :deactivate
    end
  end

  resources :tickets, :except => [:new, :edit] do
    member do
      patch :change_state
      patch :change_worker
    end
  end

end
