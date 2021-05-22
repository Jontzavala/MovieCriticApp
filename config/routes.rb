Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'critics#new'
  post '/signup' => 'critics#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :movies do
    resources :reviews
  end
  resources :reviews
  resources :critics do
    resources :movies, shallow: true
    resources :reviews, shallow: true
  end
  
end
