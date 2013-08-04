class Link < ActiveRecord::Base
  TARGETS = %w(blank self)

  belongs_to :group
  belongs_to :color
  belongs_to :border_color, :class_name => 'Color', :foreign_key => :border_color_id
  belongs_to :background_color, :class_name => 'Color', :foreign_key => :background_color_id

  validates :target, :group_id, :color_id, :border_color_id, :background_color_id, :presence => true
  validates :title, :presence => true, :uniqueness => true
  validates :href, :format => { :with => URI.regexp }, :uniqueness => true

  default_scope includes(:color, :border_color, :background_color)
end
