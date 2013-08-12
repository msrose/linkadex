class AddIndexToUsersVerificationToken < ActiveRecord::Migration
  def change
    add_index :users, :verification_token
  end
end
