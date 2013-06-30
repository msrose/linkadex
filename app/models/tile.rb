class Tile < ActiveRecord::Base
  belongs_to :group
  has_one :link

  validates :group_id, :presence => true

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :border_color, :background_color, :format => { :with => VALID_COLOR_REGEX }
end
