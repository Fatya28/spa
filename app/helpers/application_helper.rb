# frozen_string_literal: true

# module ApplicationHelper
module ApplicationHelper
  def get_image(user_id, size = 40)
    user = User.find(user_id)
    if user.avatar.attached?
      cl_image_tag(user.avatar.key, class: 'rounded-circle mx-auto', size: "#{size}x#{size}") 
    else
      image_tag 'user/default.png', class: 'rounded-circle mx-auto img-fluid', size: "#{size}x#{size}"
    end
  end
end
