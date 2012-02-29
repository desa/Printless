Printless::Application.routes.draw do
  get "users/new"
  
  match '/signup', to: 'users#new'

  root :to => 'temp_homepage#temphome'
end
