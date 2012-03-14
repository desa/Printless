class Project < ActiveRecord::Base
  attr_accessible :title, :content, :money_wanted
  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  validates :user_id, presence: true
  validates :money_wanted, presence: true
end
