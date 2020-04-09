Rails.application.routes.draw do
  resources :assignments
  devise_for :users
  resources :tasks
  resources :projects
  root "home#index"
  resources :users, only: [:show]
end
