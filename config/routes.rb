Rails.application.routes.draw do
  root "texts#index"
  devise_for :users
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index, :show]
end
