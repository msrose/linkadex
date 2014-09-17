class CreateClones < ActiveRecord::Migration
  def change
    create_table :clones do |t|
      t.belongs_to :user
      t.belongs_to :group

      t.timestamps
    end
    add_index :clones, :user_id
    add_index :clones, :group_id
  end
end
