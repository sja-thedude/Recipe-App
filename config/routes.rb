Rails.application.routes.draw do
  devise_for :users
  root 'foods#index'
  get 'users/index'
  get 'users/sign_out'
  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new show create destroy] do
  # resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    # resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :recipe_foods, only: %i[new create show destroy]
  end
  put 'recipes/:id/update', to: 'recipes#update', as: 'update'
  get 'public_recipes', to: 'recipes#public', as: 'public'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
