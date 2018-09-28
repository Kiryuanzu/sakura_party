Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'events#index'
  resources :events
  resources :attends
  #resouces: attends
  #resouces: events
end
