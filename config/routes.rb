Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  # TODO: remove me
  get  '/users/greet', to: 'users#greet'
  resources :restaurants, only: [:index, :show, :new, :create]
  resources :users
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  root 'restaurants#index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  # Sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Activations routes
  resources :account_activations, only: [:edit]

  # Password reset routes
  resources :password_resets, only: [:new, :create, :edit, :update]
end
