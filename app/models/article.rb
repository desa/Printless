class Article < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  validates :user_id, presence: true
  
  self.per_page = 5
  
  #default_scope order: 'aricle.created_at DESC'
end
