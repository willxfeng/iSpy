Rails.application.routes.draw do
  root "arts#index"
  resources :arts do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
