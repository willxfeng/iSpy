Rails.application.routes.draw do
  root "arts#index"
  resources :arts do
    resources :reviews, only: [:new, :create]
  end
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
  resources :reviews, only: [:edit, :update]
end
