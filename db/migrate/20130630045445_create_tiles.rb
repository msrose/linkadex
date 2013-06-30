class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :group_id
      t.string :border_color
      t.string :background_color

      t.timestamps
    end

    add_index :tiles, :group_id
  end
end
