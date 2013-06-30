class Group
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  has_many :links

  field :name, type: String
  field :is_public, type: Boolean, default: false
end
