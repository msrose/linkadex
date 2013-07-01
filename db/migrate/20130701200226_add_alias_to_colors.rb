class AddAliasToColors < ActiveRecord::Migration
  def change
    add_column :colors, :alias, :string
  end
end
