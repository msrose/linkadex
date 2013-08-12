class AddOrderRankToGroupsAndLinks < ActiveRecord::Migration
  def change
    add_column :groups, :order_rank, :integer
    add_column :links, :order_rank, :integer
  end
end
