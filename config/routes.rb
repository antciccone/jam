Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  get "/auth/spotify", as: :spotify_login
  get "/auth/spotify/callback", to: "sessions#create"

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#search', as: :search

  resources :users, only: [:show]
  get '/top-artists', to: 'users#artist'
  get '/top-tracks', to: 'users#tracks'

  resources :concerts, only:[:index]

  get '/sent', to:  'email#sent'

end
