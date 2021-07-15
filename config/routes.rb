Rails.application.routes.draw do
  devise_for :users
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index, :show]
end
