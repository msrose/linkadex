class AddUserIdToElements < ActiveRecord::Migration
  def change
    add_column :colors, :user_id, :integer
    add_column :groups, :user_id, :integer
  end
end
