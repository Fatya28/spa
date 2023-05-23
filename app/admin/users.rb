# frozen_string_literal: true

ActiveAdmin.register User do
  config.filters = false

  permit_params :email, :password, :password_confirmation, :role, :name, :avatar

  index do
    selectable_column
    column "Номер услуги", :id
    column "Электронный адрес",:email
    column "Роль",:role do |user|
      User::ROLES.select {|key, value| key == user.role.to_sym }.values.first
    end

    column "Создано",:created_at
    column "Количество заказов",:orders do |user|
      user.orders.count
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :description
      f.input :password
      f.input :password_confirmation
      f.input :role, selected: :master
    end
    f.actions do
      f.action :submit, :label => "Создать"
    end
  end
end
