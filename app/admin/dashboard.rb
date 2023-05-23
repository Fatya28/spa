# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    columns do
      column do
        panel 'Новые заказы' do
          table do
            thead do
              th '#'
              th 'Статус'
              th 'Мастер'
              th 'Клиент'
            end
            Order.draft.last(5).map do |order|
              tr do
                td link_to(order.id, admin_order_path(order))
                td order.status
                td order.master.email
                td order.user.email
              end
            end
          end
        end
      end

      column do
        panel 'Новые пользователи' do
          table do
            thead do
              th '#'
              th 'Имя'
              th 'Электронный адрес'
            end
            User.client.last(5).map do |user|
              tr do
                td link_to(user.id, admin_user_path(user))
                td user.name
                td user.email
              end
            end
          end
        end
      end

      column do
        panel 'Новые отзывы' do
          table do
            thead do
              th '#'
              th 'Комментарий'
              th 'Рейтинг'
              th 'Заказ'
            end
            Review.not_unblock.last(5).map do |review|
              tr do
                td link_to(review.id, admin_review_path(review))
                td review.comment
                td review.rating
                td link_to review.order_id, admin_order_path(review.order)
              end
            end
          end
        end
      end
    end
  end
end
