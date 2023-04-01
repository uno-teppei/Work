Rails.application.routes.draw do

  root 'pages#home'
  
  devise_for :users,
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}

  get 'pages/home'
  get '/profile', to: 'users#profile'
  
  post '/users/edit', to: 'users#update'
end
