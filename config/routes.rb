Rails.application.routes.draw do
  resources :users
  resources :schedules
  root 'schedules#show'

  get '/schedules/create_draft/new' => 'schedules#select_users', as: 'select_draft'
  get '/schedules/:schedule_id/draft' => 'schedules#draft', as: 'new_draft'
  put '/schedules/:schedule_id/draft' => 'schedules#edit', as: 'edit_draft'
  post '/schedules/create_draft' => 'schedules#new', as: 'draft_lobby_path'
  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy', as: 'destroy_session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
