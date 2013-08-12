class Color < ActiveRecord::Base
  has_many :groups
  has_many :links
  belongs_to :user
  before_save { |color| color.hex_value.upcase! }

  validates :user_id, :presence => true

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :hex_value, :format => { :with => VALID_COLOR_REGEX }, :uniqueness => { :scope => :user_id, :case_sensitive => false }

  validates :alias, :uniqueness => { :scope => :user_id }

  def in_use?
    groups.any? || links.any?
  end
end
