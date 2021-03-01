Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  resources :users

  root to: 'recipes#index'

  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' 

  resources :users do 
    resources :recipes, only: [:show, :new, :create, :index, :edit, :update, :destroy]
  end 

  resources :users do 
    resources :ingredients, only: [:show, :new, :create, :index, :edit, :update, :destroy]
  end 
end
