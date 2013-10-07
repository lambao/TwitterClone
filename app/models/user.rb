class User < ActiveRecord::Base
  has_many :posts
  before_save { email.downcase! }
  before_create :create_remember_token
  attr_accessible :displayName, :email, :name, :password, :password_confirmation, :remember_token, :current_password, :password_digest
  attr_accessor :current_password
  validates(:name, :displayName, :email, presence: true)  
  validates(:name, length: {maximum: 50})
  validates(:displayName, length: {maximum: 50})
  validates(:email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false})
  validates_presence_of :password, :password_confirmation, :if => :change_password?
  #validates_presence_of :password, :password_confirmation, :on => :save
  has_secure_password

  def change_password?
    (!current_password.nil?) && (!current_password.empty?)
  end
  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end
  def User.encrypt(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end
  def create_remember_token
  	self.remember_token = User.encrypt(User.new_remember_token) 
  end
  private :create_remember_token
end