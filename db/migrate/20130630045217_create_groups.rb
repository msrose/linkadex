class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :color
      t.boolean :collapsed

      t.timestamps
    end
  end
end
