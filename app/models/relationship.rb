class Relationship < ActiveRecord::Base
  attr_accessible :followedUser, :followingUser
end
