Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
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

  resources :routines, except: :index do
    resources :workouts, only: :new
    collection do
      get "confirm"
    end

    member do
      post "download"
    end
  end

  resources :workouts, only: :create

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
