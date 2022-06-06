# frozen_string_literal: true

ActiveAdmin.register Review do
  permit_params :rating, :order_id, :status, :comment

  index do
    selectable_column
    id_column
    column :order
    column :service do |review|
      link_to Service.find(review.order.service_id).title, admin_service_path(review.order.service_id)
    end
    column :status
    column :comment
    column :rating
    actions
  end

  filter :rating
  filter :order_id
  filter :status
  filter :comment

  form do |f|
    f.inputs do
      f.input :status
    end
    f.actions
  end
end
