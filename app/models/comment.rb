class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :group_id, :user_id, :body, :presence => true
end
