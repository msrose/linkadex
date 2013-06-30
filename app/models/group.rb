class Group < ActiveRecord::Base
  has_many :tiles
  has_many :links, :through => :tiles

  validates :title, :presence => true

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :color, :presence => true, :format => { :with => VALID_COLOR_REGEX }
end
