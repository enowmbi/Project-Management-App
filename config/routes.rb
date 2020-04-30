Rails.application.routes.draw do
  root "home#index"
  resources :assignments
  devise_for :users ,controllers: {confirmations: 'confirmations', invitations: 'invitations'}
  resources :teams do
    collection do 
      sortables = %w(name activity owner)
      sortables.each do |sortable|
        get "sort_by_#{sortable}_asc"
        get "sort_by_#{sortable}_desc"
      end
    end
    resources :projects do 
      resources :tasks do 
        collection do 
          sortables = %w(title priority status)
          sortables.each do |sortable|
            get "sort_by_#{sortable}_asc"
            get "sort_by_#{sortable}_desc"
          end
        end
      end

    end
  end
  # resources :memberships
  resources :users, only: [:show]
end
