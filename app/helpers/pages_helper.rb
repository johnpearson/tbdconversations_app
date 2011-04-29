module PagesHelper
  
  # Gravatar image accessible by all users to attach an image to their email
  def gravatar_for(current_user, options = { :size => 50 })
    gravatar_image_tag(current_user.email.downcase, :alt => current_user.email,
                                                    :class => 'gravatar',
                                                    :gravatar => options)
  end
end
