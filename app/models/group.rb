class Group < ActiveRecord::Base
  has_many :tiles
  has_many :links, :through => :tiles
  belongs_to :color

  validates :title, :color_id, :presence => true
end
