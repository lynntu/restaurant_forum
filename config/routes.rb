Rails.application.routes.draw do
  devise_for :users

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, only: :show
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end 
end
