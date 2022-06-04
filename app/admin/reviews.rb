ActiveAdmin.register Review do

  permit_params :rating, :order_id, :status, :comment

  index do
    selectable_column
    id_column
    column :rating
    column :order_id
    column :status
    column :comment
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
