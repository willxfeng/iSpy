Rails.application.routes.draw do
  root "arts#index"
  resources :arts, only: [:create, :new, :show]
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
