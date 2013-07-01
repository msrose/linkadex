class Link < ActiveRecord::Base
  belongs_to :tile
  belongs_to :color

  validates :tile_id, :target, :color_id, :presence => true
  validates :title, :href, :presence => true, :uniqueness => true
end
