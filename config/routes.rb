Rails.application.routes.draw do
  resources :assignments
  devise_for :users
  resources :issues
  resources :projects
  root "home#index"
  get 'home/index'
  resources :employees
  resources :users, only: [:show]
end
