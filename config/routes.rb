Rails.application.routes.draw do
  root "home#index"
  resources :assignments
  devise_for :users
  resources :teams do
    resources :projects do 
      resources :tasks
    end
  end
  # resources :memberships
  resources :users, only: [:show]
end
