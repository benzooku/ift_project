Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'landing#index'

  devise_for :users, module: 'users'
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  get 'landing', to: 'landing#index'

  get 'projects/:id', to: 'projects#index'
  get 'projects', to: 'projects#list'

  get 'landing', to: 'landing#index'
end
