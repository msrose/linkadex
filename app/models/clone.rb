class Clone < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :group, :user, :presence => true
  validates :group_id, :uniqueness => { :scope => :user_id }
end
