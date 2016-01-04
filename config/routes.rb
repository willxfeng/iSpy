Rails.application.routes.draw do

  root "arts#index"
  resources :arts, only: [:create, :new, :show]
end
