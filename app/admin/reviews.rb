# frozen_string_literal: true

ActiveAdmin.register Review do
  config.filters = false
  permit_params :rating, :order_id, :status, :comment
  actions :all, except: [:destroy, :new]

  index :title => "Все отзывы"  do
    column "Номер отзыва", :id
    column "Заказ",:order
    column "Услуга",:service do |review|
      link_to Service.find(review.order.service_id).title, admin_service_path(review.order.service_id)
    end
    column "Статус отзыва",:status do |review|
      Review::STATUSES.select {|key, value| key == review.status.try(&:to_sym) }.values.first
    end

    column "Комментарий",:comment
    column "Рейтинг",:rating
    actions
  end

  show :title => "Текущий отзыв" do
    attributes_table do
      row "Статус отзыва ", :status do |review|
        Review::STATUSES.select {|key, value| key == review.status.try(&:to_sym) }.values.first
      end
    end
  end

  form :title => "Обновление отзыва"do |f|
    f.inputs  do
      f.input :status
    end
    f.actions do
      f.action :submit, :label => "Изменить статус отзыва"
    end
  end

end
