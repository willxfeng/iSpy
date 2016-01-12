Rails.application.routes.draw do
  root "arts#index"

  resources :arts do
    resources :reviews, only: [:new, :create, :destroy]
    resources :photos, only: :create
  end

  resources :reviews, only: [:edit, :update]

  namespace :admin do
    resources :users, only: [:index]
  end

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
