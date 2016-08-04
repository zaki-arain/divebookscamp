Rails.application.routes.draw do
  resources :users
  root 'schedule#show'

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy', as: 'destroy_session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
