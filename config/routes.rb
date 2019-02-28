Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/results', to: 'places#index'
  resources :users, only: [:new, :create] do 
    resources :favorites, only: [:index, :create, :destroy]
  end
end