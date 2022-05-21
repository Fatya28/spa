# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#home'

  devise_for :users

  get 'help', to: 'static_pages#help'
  get 'contact', to: 'static_pages#contact'
  get 'gallery', to: 'static_pages#gallery'
end
