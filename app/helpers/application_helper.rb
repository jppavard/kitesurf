module ApplicationHelper
  def avatar_tag(user, options = {})
    if user.avatar.present?
      cl_image_tag(user.avatar, options)
    else
      image_tag('cat.jpeg', options)
    end
  end
end
