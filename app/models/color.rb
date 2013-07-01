class Color < ActiveRecord::Base
  has_many :groups
  has_many :tiles
  has_many :links

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :hex_value, :format => { :with => VALID_COLOR_REGEX }, :uniqueness => true
end
