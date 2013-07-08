class RemoveTileIdFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :tile_id
  end

  def down
    add_column :links, :tile_id, :integer
    add_index :links, :tile_id, :unique => true
  end
end
