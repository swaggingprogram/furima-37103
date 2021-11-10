Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :edit, :update, :show, :destroy]
end
