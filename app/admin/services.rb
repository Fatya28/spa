# frozen_string_literal: true

ActiveAdmin.register Service do
  permit_params :title, :description, :price, :performed,
                :duration, :introduction, :image

  index do
    selectable_column
    id_column
    column :title
    column :introduction
    column :description
    column :price
    column :image
    column :performed
    column :duration
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
      f.input :performed
      f.input :duration
      f.input :image, as: :file
    end
    f.actions
  end
end
