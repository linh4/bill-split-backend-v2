Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create]
  resources :bills, only: [:index, :show, :update, :create, :destroy]
  resources :items, only: [:index, :show, :update, :create, :destroy]
  resources :payers, only: [:index, :create, :show, :destroy]

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
end
