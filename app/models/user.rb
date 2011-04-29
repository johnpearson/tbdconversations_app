class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible  :name, :email, :password, :password_confirmation, :remember_me
  
  # Each user has multiple posts which are deleted when the user is deleted
  has_many :posts, :dependent => :destroy
  
  # The feed is a collection of posts for all users
  def feed
    Post.all
  end
end
