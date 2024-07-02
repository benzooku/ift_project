Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/(:locale)/', locale: /en|de/ do
    root 'landing#index'

    devise_for :users, module: 'users'
    devise_scope :user do
      get 'sign_in', to: 'users/sessions#new'
      get 'sign_up', to: 'users/registrations#new'
      get 'sign_out', to: 'users/sessions#destroy'
    end

    get 'landing', to: 'landing#index'


    get 'projects/new', to: 'projects#new'
    get 'projects', to: 'projects#index'
    post 'projects', to: 'projects#create'
    
    scope 'projects/:project_id/' do
      get '/', to: 'projects#show'
      get 'workers/add', to: 'workers#new'
      post 'workers', to: 'workers#create'
      get 'workers', to: 'workers#index'
      get 'workers/:worker_id', to: 'workers#show'

      post '/workers/:worker_id', to: 'workers#add_role', as: 'add_role_workers' 
      delete '/workers/:worker_id/:role_id', to: 'workers#delete_role', as: 'delete_role_workers'

      get 'tasks/new', to: 'tasks#new'
      get 'tasks', to: 'tasks#index'
      post 'tasks', to: 'tasks#create'
      get 'tasks/:task_id', to: 'tasks#show'
      get 'tasks/:task_id/edit', to: 'tasks#edit'
      patch 'tasks/:task_id', to: 'tasks#update', as: 'update_tasks'

      post 'tasks/:task_id', to: 'task_notes#create', as: 'create_task_note'
    end


    get 'landing', to: 'landing#index'
  end
  get '/:locale' => 'landing#index'
end
