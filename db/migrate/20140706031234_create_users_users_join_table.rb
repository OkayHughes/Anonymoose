class CreateUsersUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :users_users , id: false do |t|
      t.integer :user_id
      t.integer :user_id	
    end
    add_index :users_users, [:user_id, :user_id]
  end
end
