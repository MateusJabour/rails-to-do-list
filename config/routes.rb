Rails.application.routes.draw do
  root 'pages#home'

  get '/choose/:locale' => 'choose_locale#choose', as: 'choose_locale'

  scope '/:locale' do
    get '/' => 'pages#home', as: 'home'

    get '/signup' => 'signup#new'
    post '/signup' => 'signup#create'

    get '/login' => 'login#new'
    post '/login' => 'login#create'
    post '/logout' => 'login#destroy'

    get '/tasks' => 'tasks#index'
    post '/tasks' => 'tasks#create', as: 'new_task'
    patch '/tasks' => 'tasks#batch_update', as: 'update_tasks'
  end

end
