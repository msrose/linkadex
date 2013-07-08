class Link < ActiveRecord::Base
  TARGETS = %w(blank self)

  belongs_to :group
  belongs_to :color
  belongs_to :border_color, :class_name => 'Color', :foreign_key => :border_color_id
  belongs_to :background_color, :class_name => 'Color', :foreign_key => :background_color_id

  validates :target, :group_id, :color_id, :border_color_id, :background_color_id, :presence => true
  validates :title, :href, :presence => true, :uniqueness => true
end
