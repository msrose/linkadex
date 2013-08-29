class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, :unique => true
    User.reset_column_information
    User.all.each do |user|
      username = user.email.split('@').first.split(/[^A-Za-z0-9\-_.]+/).join('-')
      until user.update_attribute(:username, username) do
        username << rand(10)
      end
    end
  end
end
