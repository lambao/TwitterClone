class User < ActiveRecord::Base
  attr_accessible :displayName, :email, :name, :password, :password_confirmation, :remember_token, :current_password, :password_digest
  attr_accessor :current_password

  #Relational
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "followedUser", dependent: :destroy
  has_many :followingUsers, through: :relationships, source: :followingUser

  before_save { email.downcase! }
  before_create :create_remember_token
  
  #validate
  validates(:name, :displayName, :email, presence: true)  
  validates(:name, length: {maximum: 50})
  validates(:displayName, length: {maximum: 50})
  validates(:email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false})
  validates_presence_of :password, :password_confirmation, :if => :change_password?
  
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
  def feed
    Micropost.where("user_id = ?", id)
  end
  def following?(other_user)
    relationships.find_by followedUser: other_user.id
  end
  def follow!(other_user)
    relationships.create!(followedUser: other_user.id)
  end
  def unfollow!(other_user)
    relationships.find_by(followingUser: other_user.id).destroy!
  end
  def world_feed
  end
  private :create_remember_token
end