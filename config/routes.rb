# frozen_string_literal: true

Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  resources :services do
    resources :orders, only: %i[create new]
  end
  resources :orders, only: %i[index show]

  match '/services/:service_id/orders/new', to: 'orders#new', via: %i[get post]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#home'

  devise_for :users

  get 'help', to: 'static_pages#help'
  get 'contact', to: 'static_pages#contact'
  get 'gallery', to: 'static_pages#gallery'
end
