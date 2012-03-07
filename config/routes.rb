Printless::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  get '/signout', to: 'sessions#destroy', via: :delete
  
  match '/postarticle', to: 'articles#new'

  root :to => 'temp_homepage#temphome'
end
