# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :name

  index do
    column :name
    column :count_services do |category|
      category.services.count
    end
    actions
  end

  filter :name
  filter :count_services

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
