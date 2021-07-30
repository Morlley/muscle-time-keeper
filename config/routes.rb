Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "workouts#index"
  resources :users, only: :show do
    member do
      get "me"
    end
  end
end
