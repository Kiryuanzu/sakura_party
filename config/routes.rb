Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'events#index'
  #resouces: attends
  #resouces: events
end
