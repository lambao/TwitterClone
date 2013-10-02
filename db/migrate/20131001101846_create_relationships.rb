class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :followedUser
      t.integer :followingUser

      t.timestamps
    end
  end
end
