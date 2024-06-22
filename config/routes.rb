Rails.application.routes.draw do
  devise_for :admins
  devise_for :super_admins, controllers: {
    sessions: 'super_admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Rutas para eventos públicos (sin prefijo)
  resources :events, only: [:index, :show]

  # Namespace para usuarios
  namespace :users do
    resources :events # Eventos creados por el usuario
    resources :purchases, only: [:show] do
      resources :payments, only: [:new, :create]
    end
  end

  namespace :super_admins do
    resources :categories
    resources :admins
    resources :cities do
      get 'event_statistics', on: :collection
    end
  end

  namespace :admins do
    get "/me", to: "admins#me"
    resources :events
    resources :dashboard
  end

  # Rutas adicionales
  post 'add_to_cart', to: 'users/purchases#create', as: 'add_to_cart'

  # Ruta raíz
  root "events#index"
end
