# frozen_string_literal: true

Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users
  

  get '/', to: 'static_pages#home'
  get 'help', to: 'static_pages#help'

end
