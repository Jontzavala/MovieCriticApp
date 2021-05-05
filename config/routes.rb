Rails.application.routes.draw do

  get '/signup' => 'critics#new'
  post '/signup' => 'critics#create'


  resources :reviews
  resources :critics
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
