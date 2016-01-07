Rails.application.routes.draw do
  root "arts#index"
  resources :arts
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
