class User < ActiveRecord::Base
  before_save { email.downcase! }
  attr_accessible :displayName, :email, :name, :password, :password_confirmation
  validates(:name, :displayName, :email, presence: true)  
  validates(:name, length: {maximum: 50})
  validates(:displayName, length: {maximum: 50})
  validates(:email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false})
  has_secure_password
end
