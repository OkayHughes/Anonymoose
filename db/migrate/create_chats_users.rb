class CreateChatsUsers < ActiveRecord::Migration
  def change
    create_table :chats_users do |t|

      t.timestamps
    end
  end
end
