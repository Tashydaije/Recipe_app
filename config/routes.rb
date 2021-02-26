Rails.application.routes.draw do
  resources :recipes
  resources :users

  root to: 'recipes#index'
  get 'new', to: 'recipes#new'

  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 
end
