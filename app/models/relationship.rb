class Relationship < ActiveRecord::Base
  attr_accessible :followedUser, :followingUser
  belongs_to :followedUser, class_name: "User"
  belongs_to :followingUser, class_name: "User"
end
