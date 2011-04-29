class PostsController < ApplicationController
  before_filter :authenticate_user! 
  
  # A post is created by a user through a user and saved to the database
  # The user is then redirected to the home page
  # If the post isn't saved the feed_items variable is empty and the user is redirected
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:notice] = "Post Created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
end