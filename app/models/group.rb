class Group < ActiveRecord::Base
  has_many :links, :dependent => :destroy
  has_many :clones, :dependent => :destroy
  has_many :cloned_users, :through => :clones, :source => :user
  belongs_to :color
  belongs_to :user

  validates :user_id, :presence => true

  validates :color_id, :presence => true

  validates :title, :presence => true, :uniqueness => { :scope => :user_id }

  default_scope includes(:color).order(:order_rank, :title)
end
