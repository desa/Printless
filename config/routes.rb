Printless::Application.routes.draw do
  resources :users do
    resources :aricles, only: [:create, :edit, :destroy]
    resources :projects, only: [:create, :edit, :destroy]
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root :to => 'temp_homepage#temphome'
end
