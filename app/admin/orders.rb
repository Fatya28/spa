ActiveAdmin.register Order do
  permit_params :service_id, :user_id, :master_id, :status

  index do
    selectable_column
    id_column
    column :service do |order|
      link_to order.service.title, admin_service_path(order.service.id)
    end
    column :price do |order|
      number_to_currency order.service.price
    end
    column :user do |order|
      link_to order.user.email, admin_user_path(order.user.id)
    end
    column :master do |order|
      link_to order.master.email, admin_user_path(order.master.id)
    end
    column :status

    actions
  end

  filter :created_at
  filter :status

  form do |f|
    f.inputs do
      f.input :service_id
      f.input :user_id
      f.input :master_id
      f.input :status
    end
    f.actions
  end

end
