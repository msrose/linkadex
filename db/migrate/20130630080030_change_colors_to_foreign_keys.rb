class ChangeColorsToForeignKeys < ActiveRecord::Migration
  def up
    add_column :groups, :color_id, :integer
    remove_column :groups, :color
    add_column :tiles, :border_color_id, :integer
    remove_column :tiles, :border_color
    add_column :tiles, :background_color_id, :integer
    remove_column :tiles, :background_color
    add_column :links, :color_id, :integer
    remove_column :links, :color
  end

  def down
    add_column :groups, :color, :string
    remove_column :groups, :color_id
    add_column :tiles, :border_color, :string
    remove_column :tiles, :border_color_id
    add_column :tiles, :background_color, :string
    remove_column :tiles, :background_color_id
    add_column :links, :color, :string
    remove_column :links, :color_id
  end
end
