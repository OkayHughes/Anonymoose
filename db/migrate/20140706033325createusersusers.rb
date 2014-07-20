class CreateUsersUsers < ActiveRecord::Migration
  def change
    create_table :users_users do |t|

      t.timestamps
    end
  end
end
