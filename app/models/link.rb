class Link < ActiveRecord::Base
  belongs_to :tile

  validates :tile_id, :href, :title, :target, :presence => true

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :color, :format => { :with => VALID_COLOR_REGEX }
end
