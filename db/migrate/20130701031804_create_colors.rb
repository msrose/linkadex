class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex_value

      t.timestamps
    end

    add_index :colors, :hex_value
  end
end
