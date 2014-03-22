class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username
  has_many :groups

  def groups
    object.groups.where(:private => false)
  end
end
