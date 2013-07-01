class Group < ActiveRecord::Base
  has_many :tiles, :dependent => :destroy
  has_many :links, :through => :tiles
  belongs_to :color

  validates :color_id, :presence => true
  validates :title, :presence => true, :uniqueness => true
end
