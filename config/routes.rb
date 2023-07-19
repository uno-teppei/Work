Rails.application.routes.draw do

  root 'tops#home'
  
  devise_for :users,
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  get 'tops/home'
  get '/character', to: 'users#character'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'posts/search', to: 'posts#search'

  post '/users/edit', to: 'users#update'

  resources :posts
end
