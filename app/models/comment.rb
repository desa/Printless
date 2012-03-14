class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commentable_id, :commentable_type
  
  belongs_to :commentable, polymorphic: true
  
  validates :content, presence: true
  validates :user_id, presence: true
  
end
