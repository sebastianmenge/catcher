class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :project
  embeds_many :links

  field :name, type: String
  field :is_public, type: Boolean, default: false

  validates_presence_of :name
end
