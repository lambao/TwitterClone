class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :userId
      t.text :content
      t.integer :parentPost

      t.timestamps
    end
  end
end
