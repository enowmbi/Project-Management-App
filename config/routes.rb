Rails.application.routes.draw do
  root "home#index"
  resources :teams
  resources :assignments
  devise_for :users
  resources :projects do 
    resources :tasks
  end
  # resources :memberships
  resources :users, only: [:show]
end
