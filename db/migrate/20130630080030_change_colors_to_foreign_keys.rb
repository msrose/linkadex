class ChangeColorsToForeignKeys < ActiveRecord::Migration
  def up
    change_column :groups, :color, :integer
    rename_column :groups, :color, :color_id
    change_column :tiles, :border_color, :integer
    rename_column :tiles, :border_color, :border_color_id
    change_column :tiles, :background_color, :integer
    rename_column :tiles, :background_color, :background_color_id
    change_column :links, :color, :integer
    rename_column :links, :color, :color_id
  end

  def down
    change_column :groups, :color_id, :string
    rename_column :groups, :color_id, :color
    change_column :tiles, :border_color_id, :string
    rename_column :tiles, :border_color_id, :border_color
    change_column :tiles, :background_color_id, :string
    rename_column :tiles, :background_color_id, :background_color
    change_column :links, :color_id, :string
    rename_column :links, :color_id, :color
  end
end
