Printless::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, has_many: :comments
  resources :projects, has_many: :comments
  resources :relationships, only: [:create, :destroy]
  resources :invitation_lists, only: [:new, :create]
  
  #Change back for live version
  #match '/signup',  to: 'users#new'
  match '/signup', to: 'invitation_lists#temphome'
  match '/signin',  to: 'sessions#new'
  get '/signout', to: 'sessions#destroy', via: :delete

  root :to => 'invitation_lists#temphome'
end
