# frozen_string_literal: true

ActiveAdmin.register Service do
  permit_params :title, :description, :price, :performed,
                :category_id, :introduction

  index do
    selectable_column
    id_column
    column :title
    column :introduction
    column :price do |service|
      number_to_currency service.price
    end
    column :performed
    column :orders do |service|
      service.orders.count
    end
    column :rating
    actions
  end

  filter :title
  filter :description
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :introduction
      f.input :description
      f.input :price
      f.input :category
      f.input :performed
      f.input :image, as: :file
    end
    f.actions
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
    active_admin_comments
  end
end
