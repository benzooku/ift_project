Rails.application.routes.draw do
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/:locale' => 'homepage#index'
    root 'homepage#index'

    devise_for :users
    get 'homepage', to: 'homepage#index'

    get 'projects/:id', to: 'projects#index'
  end
end
