class User < ActiveRecord::Base
  attr_accessible :name, :email, :about_me, :twitter_id, :interests,
                  :password, :password_confirmation, :journalist
  has_secure_password
  
  has_many :projects, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :donations
  
  #has_many :benefactors, through: :donations, source: :donatee
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:    :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  
  
  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end
  
  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end 
  
end
