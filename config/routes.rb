Rails.application.routes.draw do
  root 'pages#home'

  get '/signup' => 'signup#new'
  post '/signup' => 'signup#create'

  get '/login' => 'login#new'
  post '/login' => 'login#create'

  get '/tasks' => 'tasks#index'
end
