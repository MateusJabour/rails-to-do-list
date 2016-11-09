Rails.application.routes.draw do
  root 'pages#home'

  get '/signup' => 'signup#new'
  post '/signup' => 'signup#create'
  get '/login' => 'login#new'
end
