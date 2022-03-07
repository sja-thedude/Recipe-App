Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get 'users/index'
  get 'users/sign_out'
  resources :users, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
