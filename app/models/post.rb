class Post < ActiveRecord::Base
	attr_accessible :content, :parentPost, :user_id
  	belongs_to :user, dependent: :destroy
  	default_scope -> {order('create_at DESC')}
  	validates :userId, presence: true
  	validates :content, presence: true, length: {maximum: 140}
end
