# frozen_string_literal: true

ActiveAdmin.register Order do
  config.filters = false
  actions :all, except: [:destroy, :new]
  permit_params :service_id, :user_id, :master_id, :status


  index :title => "Все заказы" do
    selectable_column
    column "Номер услуги", :id
    column "Услуга", :service do |order|
      link_to order.service.title, admin_service_path(order.service.id)
    end
    column "Цена",:price do |order|
      number_to_currency order.service.price
    end
    column "Клиент",:user do |order|
      link_to order.user.email, admin_user_path(order.user.id)
    end
    column "Мастер",:master do |order|
      link_to order.master.email, admin_user_path(order.master.id)
    end
    column "Статус заказа",:status do |order|
      Order::STATUSES.select {|key, value| key == order.status.to_sym }.values.first
    end

    actions
  end

  show :title => "Текущий заказ" do
    attributes_table do
      row "Услуга", :service do |order|
        link_to order.service.title, admin_service_path(order.service.id)
      end
      row "Цена",:price do |order|
        number_to_currency order.service.price
      end
      row "Клиент",:user do |order|
        link_to order.user.email, admin_user_path(order.user.id)
      end
      row "Мастер",:master do |order|
        link_to order.master.email, admin_user_path(order.master.id)
      end
      row "Статус заказа",:status do |order|
        Order::STATUSES.select {|key, value| key == order.status.to_sym }.values.first
      end
    end
  end

  form :title => "Обновить заказ" do |f|
    f.inputs do
      f.input :status
    end
    f.actions do
      f.action :submit, :label => "Обновить статус"
    end
  end
end
