class DropTitleFromChats < ActiveRecord::Migration
  def change
    remove_column :chats, :title
  end
end
