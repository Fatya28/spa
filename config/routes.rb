# frozen_string_literal: true

Rails.application.routes.draw do
  resources :services do
    resources :orders, only: %i[create new]
  end

  resources :orders, only: %i[index show] do
    resources :reviews
    member do
      patch :update_status
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#home'

  devise_for :users
  resources :users
  get 'gallery', to: 'static_pages#gallery'
  get 'profile', to: 'users#profile'
  get 'masters', to: 'masters#index'
  resources :masters, only: %i[index show]
end
