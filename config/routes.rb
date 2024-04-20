Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'landing#index'

  devise_for :users
  get 'landing', to: 'landing#index'

  get 'projects/:id', to: 'projects#index'
  get 'projects', to: 'projects#list'

  get 'landing', to: 'landing#index'
end
