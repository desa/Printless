Printless::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :aricles, only: [:create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root :to => 'temp_homepage#temphome'
end
