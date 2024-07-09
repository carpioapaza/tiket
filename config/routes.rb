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
    get 'dashboard', to: 'dashboard#index'
    resources :categories
    resources :admins
    resources :events, only: [:index, :show, :update, :new]
    resources :reports, only: [:index] do
      post 'generate_and_download_report', on: :collection
    end
    resources :cities do
    get 'event_statistics', on: :collection
  end
  root "dashboard#index"

    # Otras rutas que puedas necesitar para settings, stats, etc.
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
