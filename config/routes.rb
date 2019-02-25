Rails.application.routes.draw do
   get '/home', to: 'home#index'
   get '/login', to: 'sessions#new'
   resources :users, only: [:new, :create, :show]
end