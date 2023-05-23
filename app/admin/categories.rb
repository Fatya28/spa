# frozen_string_literal: true

ActiveAdmin.register Category  do
  config.filters = false
  permit_params :name
  actions :all, except: [:destroy]

  index do
    column "Название", :name
    column "Количество услуг", :count_services do |category|
      category.services.count
    end
    actions
  end

  show :title => "Категория заказа" do
    attributes_table do
      row "Название", :name do |category|
        category.name
      end
      row "Количество услуг", :count_services do |category|
        category.services.count
      end
    end
  end

  form title: 'Категория услуг' do |f|
    f.inputs do
      f.input :name
    end
    f.actions do
      f.action :submit, :label => category.id.nil? ? "Создать" : "Обновить"
    end
  end
end
