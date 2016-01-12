Rails.application.routes.draw do
  root "arts#index"

  resources :arts do
    resources :reviews, only: [:new, :create]
    resources :photos, only: :create
  end

  resources :reviews, only: [:edit, :update]

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
