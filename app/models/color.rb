class Color < ActiveRecord::Base
  has_many :groups
  has_many :links
  belongs_to :user
  before_save { |color| color.hex_value.upcase! }

  default_scope order(:alias, :hex_value)

  validates :user_id, :presence => true

  VALID_COLOR_REGEX = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
  validates :hex_value, :format => { :with => VALID_COLOR_REGEX }, :uniqueness => { :scope => :user_id, :case_sensitive => false }

  validates :alias, :uniqueness => { :scope => :user_id, :allow_blank => true }

  def links
    Link.select('DISTINCT links.*').where('color_id = :id OR background_color_id = :id OR border_color_id = :id', :id => self.id)
  end

  def in_use?
    groups.any? || links.any?
  end
end
