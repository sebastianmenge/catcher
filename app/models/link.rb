class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  embedded_in :group

  field :url, type: String
  field :title, type: String
  field :description, type: String
  field :image_url, type: String
  field :favicon_url, type: String
end
