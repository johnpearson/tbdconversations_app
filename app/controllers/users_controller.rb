class UsersController < ApplicationController
  before_filter :authenticate_user!
  # Admins are the only ones with access to deleting users
  before_filter :admin_user,  :only => :destroy
  
  # 'Show' handles the Profile page that shows all the posts and profile info for
  # each user, paginate is used to limit each page to 10 posts
  def show
    @user = User.find(params[:id])
    @post = Post.new
    if current_user.admin?
      @admin_posts = current_user.posts
      @user_posts = @user.posts
      @posts = @admin_posts + @user_posts
    else
      @posts = @user.posts.paginate(:page => params[:page], :per_page => 10)
    end
    @title = @user.name
  end
  
  # Admins can view all users and the users' posts
  def index
    if current_user.admin?
      @users = User.paginate(:page => params[:page], :per_page => 10)
      @title = "All Users"
    else
      redirect_to root_path
    end
  end
  
  # Admins can see the delete link and destroy users
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to root_path
  end
  
  private
  
    # Private method to define admin
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end