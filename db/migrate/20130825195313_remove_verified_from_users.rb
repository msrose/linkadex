class RemoveVerifiedFromUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.where(:verified => true).update_all(:verification_token => nil)
    remove_column :users, :verified
  end

  def down
    add_column :users, :verified, :boolean, :default => false
    User.reset_column_information
    User.where(:verification_token => nil).update_all(:verified => true)
  end
end
