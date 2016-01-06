Rails.application.routes.draw do
  root "arts#index"
  resources :arts do
    resources :photos, only: [:create, :destroy]
  end

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }
end
