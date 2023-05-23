# frozen_string_literal: true

ActiveAdmin.register Service do
  config.filters = false

  permit_params :title, :description, :price, :performed,
                :category_id, :introduction, :image

  index do
    selectable_column
    column "Номер услуги", :id
    column "Наименование",:title
    column "Введение",:introduction
    column "Цена",:price do |service|
      number_to_currency service.price
    end

    column "Выполнение",:performed do |service|
      Service::PERFOMED.select {|key, value| key == service.performed }.values.first
    end

    column "Количество заказов",:orders do |service|
      service.orders.count
    end
    column "Рейтинг",:rating
    actions
  end

  form do |f|
    f.inputs "Услуга" do
      f.input :title
      f.input :introduction
      f.input :description
      f.input :price
      f.input :category
      f.input :performed
      f.input :image, as: :file
    end
    f.actions do
      f.action :submit, :label => service.id.nil? ? "Создать" : "Обновить"
    end
  end

  show do
    attributes_table do
      row :title
      row :price
      row :created_at
      row :performed
      row :introduction
      row :description
      row :categiry
      row :image do |_ad|
        image_tag url_for(service.image), size: '200x120'
      end
      row :rating
    end

  end
end
