Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "arts#index"
  resources :arts, only: [:create, :new, :show]
end
