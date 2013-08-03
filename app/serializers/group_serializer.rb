class GroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :color
  has_many :links

  def color
    object.color.hex_value
  end
end
