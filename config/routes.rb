Rails.application.routes.draw do
  root "home#index"
  resources :teams
  resources :assignments
  devise_for :users
  resources :tasks
  resources :projects
  resources :users, only: [:show]
end
