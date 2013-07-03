class ContextSerializer < ActiveModel::Serializer
  attributes :id, :name
  embed :ids

  has_many :groups
end
