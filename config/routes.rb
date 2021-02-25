Rails.application.routes.draw do
  resources :users
  get 'login', to: 'users#login'
  post 'login_auth', to: 'users#login_auth' 
end