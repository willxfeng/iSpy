Rails.application.routes.draw do
  get "home", to: "home#show"
  root "home#show"

  resources :arts do
    resources :reviews, only: [:new, :create, :destroy]
    resources :photos, only: :create
  end

  resources :reviews, only: [:edit, :update] do
    resources :votes, only: [:create]
  end

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }

  get '/search' => 'search#index'
end
