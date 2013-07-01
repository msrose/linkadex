class Tile < ActiveRecord::Base
  belongs_to :group
  belongs_to :border_color, :class_name => 'Color', :foreign_key => :border_color_id
  belongs_to :background_color, :class_name => 'Color', :foreign_key => :background_color_id
  has_one :link

  validates :group_id, :border_color_id, :background_color_id, :presence => true
end
