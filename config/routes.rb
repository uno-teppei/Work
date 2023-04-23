Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  root 'pages#home'
  
  devise_for :users,
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}

  get 'pages/home'
  get '/character', to: 'users#character'
  get '/users/:id', to: 'users#show', as: 'user'

  post '/users/edit', to: 'users#update'
end
