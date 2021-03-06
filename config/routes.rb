Rails.application.routes.draw do
  resources :categories do
    resources :properties
  end
  resources :favourites
  root to: 'categories#index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
