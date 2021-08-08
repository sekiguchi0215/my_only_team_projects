Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "texts#index"
  devise_for :users
  resources :texts, only: [:index, :show]
  resources :movies, only: [:index, :show]
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
