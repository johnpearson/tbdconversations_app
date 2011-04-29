class PagesController < ApplicationController
  
  # This controller will handle the static pages of home, about and contact
  # Base title is set in application_helper.rb
  
  def home
    @title = "Home"
    # If a user is signed in the home page fills with posts and is paginated by 10
    if user_signed_in?
      @post = Post.new
      @feed_items = current_user.feed.paginate(:page => params[:page],
                                               :per_page => 10)
    end
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

end
