Rails.application.routes.draw do
  get 'routines/new'
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
  resources :routines, only: [:new, :create] do
    collection do
      get "confirm"
    end
  end
end
