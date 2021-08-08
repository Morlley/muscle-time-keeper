Rails.application.routes.draw do
  get 'routines/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "workouts#index"
  resources :users, only: :show do
    resources :routines, only: :index
    member do
      get "me"
    end
  end

  resources :routines, except: [:show, :index] do
    resources :workouts, only: :new
    collection do
      get "confirm"
    end
  end

  resources :workouts, only: :create
end
