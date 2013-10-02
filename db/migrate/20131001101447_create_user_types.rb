class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.integer :type
      t.string :description

      t.timestamps
    end
  end
end
