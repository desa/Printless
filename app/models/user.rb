# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  about_me   :string(255)
#  journalist :boolean
#  twitter_id :string(255)
#  interests  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_protected :journalist
  attr_accessible :name, :email, :about_me, :twitter_id, :interests,
                  :password, :password_confirmation
  has_secure_password
  
  has_many :aticles, dependent: :destroy
  
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end 
  
end
