Rails.application.routes.draw do

  root to: 'maps#index'
  
  devise_for :users,
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  get 'maps/index'
  get '/character', to: 'users#character'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'posts/search', to: 'posts#search'

  post '/users/edit', to: 'users#update'
  
  resources :maps, only: [:index]
  resources :posts
end
