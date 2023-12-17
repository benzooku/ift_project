Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '(:locale)', locale: /en|de/ do
    get '/:locale' => 'homepage#index'
    root 'homepage#index'
    devise_for :users
    get 'homepage', to: 'homepage#index'
  end
end
