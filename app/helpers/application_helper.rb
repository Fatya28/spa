# frozen_string_literal: true

# module ApplicationHelper
module ApplicationHelper
  def get_image(user_id, size = 40)
    user = User.find(user_id)
    if user.avatar.attached?
      image_tag url_for(user.avatar), class: 'rounded-circle mx-auto', size: "#{size}x#{size}"
    else
      image_tag 'user/default.png', class: 'rounded-circle mx-auto', size: "#{size}x#{size}"
    end
  end
end
