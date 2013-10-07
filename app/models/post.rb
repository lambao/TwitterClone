class Post < ActiveRecord::Base
	attr_accessible :content, :parentPost, :userId
  	belongs_to :user, dependent: :destroy
  	default_scope -> {order('create_at DESC')}
  	validates :userId, presence: true
  	validsates :content, presence: true, length: {maximum: 140}
end
