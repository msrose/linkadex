class AddAttributesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :group_id, :integer
    add_column :links, :background_color_id, :integer
    add_column :links, :border_color_id, :integer
  end
end
