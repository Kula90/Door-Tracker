Rails.application.routes.draw do
  devise_for :users

  resources :construction_sites do
    resources :requested_deliveries, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        patch :mark_as_delivered
      end
    end

    resources :delivered_deliveries, only: [:index, :new, :create, :edit, :update, :destroy], controller: 'delivered_deliveries' do
      collection do
        get 'new', to: 'delivered_deliveries#new', as: :new_delivered_delivery
      end
    end

    resources :door_installations, only: [:index, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'new', to: 'door_installations#new', as: :new_door_installation
      end
    end
  end

  namespace :admin do
    root to: 'admin#index', as: :dashboard
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :construction_sites, only: [:index, :edit, :update, :destroy]
  end

  root to: 'construction_sites#index'
end
