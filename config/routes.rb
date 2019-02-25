Rails.application.routes.draw do
   get '/home', to: 'home#index'
   resources :users, only: [:new, :create]
end