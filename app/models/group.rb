class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :project
  embeds_many :links

  field :name, type: String
  field :is_public, type: Boolean, default: true

  validates_presence_of :name

  def self.create_initial_for_user(user)
    user.projects.first.groups.create(name: "Collector", is_public: true)
    sleep 1
    user.projects.first.groups.create(name: "Vacation", is_public: true)
  end
end
