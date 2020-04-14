Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:show]
  resources :teams
  resources :assignments
  devise_for :users
  resources :tasks
  resources :projects
end
