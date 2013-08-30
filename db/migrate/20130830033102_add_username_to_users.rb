class AddUsernameToUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def change
    add_column :users, :username, :string
    add_index :users, :username, :unique => true
    User.reset_column_information
    User.all.each do |user|
      username = user.email.split('@').first.split(/[^A-Za-z0-9]+/).join
      user.update_attribute(:username, username)
    end
  end
end
