# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :name, :avatar

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    column :orders do |user|
      user.orders.count
    end
    actions
  end

  filter :email
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :description
      f.input :password
      f.input :password_confirmation
      f.input :role, selected: :master
      f.input :avatar, as: :file
    end
    f.actions
  end
end
