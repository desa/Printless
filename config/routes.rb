Printless::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :projects
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  get '/signout', to: 'sessions#destroy', via: :delete

  root :to => 'temp_homepage#temphome'
end
