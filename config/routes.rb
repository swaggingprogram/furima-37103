Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :orders, only: [:index, :new, :create]
end
