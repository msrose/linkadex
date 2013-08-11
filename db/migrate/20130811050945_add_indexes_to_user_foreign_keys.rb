class AddIndexesToUserForeignKeys < ActiveRecord::Migration
  def change
    add_index :groups, :user_id
    add_index :colors, :user_id
  end
end
