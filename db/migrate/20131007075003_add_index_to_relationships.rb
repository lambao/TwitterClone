class AddIndexToRelationships < ActiveRecord::Migration
  def change
  	add_index :relationships, :followedUser
  	add_index :relationships, :followingUser
  	add_index :relationships, [:followedUser, :followingUser], unique: true
  end
end
