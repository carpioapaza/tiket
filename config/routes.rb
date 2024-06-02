Rails.application.routes.draw do
    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    
  # scope module: "users" do
  namespace :users do
    resources :events
  end
  namespace :admins do
    resources :categories
  end
  get '/events', to: 'home#index'
  root "home#index"

    # Captura cualquier ruta no encontrada y muestra un error 404

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
