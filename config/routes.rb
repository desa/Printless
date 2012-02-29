Printless::Application.routes.draw do
  resources :users
  
  match '/signup', to: 'users#new'

  root :to => 'temp_homepage#temphome'
end
