class AddIndexesToLinksForeignKeys < ActiveRecord::Migration
  def change
    add_index :links, :group_id
    add_index :links, :background_color_id
    add_index :links, :border_color_id
  end
end
