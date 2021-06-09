Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :games do
    resources :reviews
  end
  resources :users do
    resources :games, only: [:new,:create,:index,:show]
  end
  resources :reviews 

  get "/auth/:provider/callback" => 'sessions#omniauth'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
