class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_public
  embed :ids

  has_many :links
end
