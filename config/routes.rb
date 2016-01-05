Rails.application.routes.draw do
  root "arts#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :arts, only: [:create, :new, :show]
end
