# frozen_string_literal: true

Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users

  get 'help', to: 'static_pages#help'
  get 'contact', to: 'static_pages#contact'

end
