Rails.application.routes.draw do

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
end
