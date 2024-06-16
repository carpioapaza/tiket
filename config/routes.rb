Rails.application.routes.draw do
  devise_for :admins
    devise_for :super_admins, controllers: {
      sessions: 'super_admins/sessions'
    }
  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    
  # scope module: "users" do
  namespace :users do
    resources :events
  end
  namespace :super_admins do
    resources :categories
    resources :admins
    resources :cities do
      get 'event_statistics', on: :collection
    end
  end
  namespace :admins do
    # resources :admins
    get "/me", to: "admins#me"
    resources :events
    resources :dashboard
  end
  
  get '/events/:id', to: 'events#show', as: :event
  get '/events', to: 'events#index'
  get '/events/:filter', to: 'events#index_by_filter', as: :events_by_filter

  root "events#index"

end
