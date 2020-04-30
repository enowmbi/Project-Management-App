Rails.application.routes.draw do
  root "home#index"
  resources :assignments
  devise_for :users ,controllers: {confirmations: 'confirmations', invitations: 'invitations'}
  resources :teams do
    resources :projects do 
      resources :tasks do 
        collection do 
          get 'sort_by_title_asc'
          get 'sort_by_title_desc'
          get 'sort_by_priority_asc'
          get 'sort_by_priority_desc'
          get 'sort_by_status_asc'
          get 'sort_by_status_desc'
        end
      end

    end
  end
  # resources :memberships
  resources :users, only: [:show]
end
