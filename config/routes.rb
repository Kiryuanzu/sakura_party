Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'events#index'
  get 'secret' => 'events#secret'
  resources :events, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :attends, only: [:create, :destroy]
  resources :users, only: [:show]
end
