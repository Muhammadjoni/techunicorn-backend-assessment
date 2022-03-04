Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :doctors do
    collection do
      get :my_appointments
    end
  end

  resources :patients do
    collection do
      get :my_sessions
    end
  end

  resources :appointments

  resources :clinic_admins do
    collection do
      get :appointments
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
