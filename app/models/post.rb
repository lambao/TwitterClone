class Post < ActiveRecord::Base
  attr_accessible :content, :parentPost, :userId
end
