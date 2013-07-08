class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :image_url, :favicon_url, :created_at, :updated_at
end
