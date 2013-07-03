class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :context
  has_many :links, dependent: :destroy

  field :name, type: String
  field :is_public, type: Boolean, default: false
end
