class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_public, :created_at, :updated_at
  embed :ids, include: true

  has_many :links
end
