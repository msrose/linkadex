class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :tile_id
      t.string :title
      t.string :href
      t.string :color
      t.string :target

      t.timestamps
    end

    add_index :links, :tile_id, :unique => true
  end
end
