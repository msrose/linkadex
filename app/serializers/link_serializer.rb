class LinkSerializer < ActiveModel::Serializer
  attributes :id, :target, :title, :href, :color, :background_color, :border_color

  def color
    object.color.hex_value
  end

  def border_color
    object.border_color.hex_value
  end

  def background_color
    object.background_color.hex_value
  end
end
