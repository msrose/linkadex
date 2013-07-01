class AddIndexesToColorForeignKeys < ActiveRecord::Migration
  def change
    add_index :groups, :color_id
    add_index :tiles, :background_color_id
    add_index :tiles, :border_color_id
    add_index :links, :color_id
  end
end
