class Link < ActiveRecord::Base
  belongs_to :tile
  belongs_to :color

  validates :tile_id, :href, :title, :target, :color_id, :presence => true
end
