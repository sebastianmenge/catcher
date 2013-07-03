class Context
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  belongs_to :user
  has_many :groups, dependent: :destroy
end
