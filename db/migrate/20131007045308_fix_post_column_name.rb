class FixPostColumnName < ActiveRecord::Migration
  def up
  	rename_column :Posts, :userId, :user_id
  end

  def down
  end
end
