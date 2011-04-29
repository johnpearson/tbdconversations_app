class Post < ActiveRecord::Base
  attr_accessible :content
  
  # Posts are created by a user and belong to a user by user_id
  belongs_to :user
  
  # Validations for presence and a max length of 240 characters for content
  validates :content, :presence => true, :length => { :maximum => 240 }
  validates :user_id, :presence => true
  
  # For the default scope the posts are put in descending order
  default_scope :order => 'posts.created_at DESC'
end
