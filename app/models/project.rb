class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  belongs_to :user
  has_many :groups, dependent: :destroy

  def self.create_initial_for_user(user)
    name = "#{user.first_name}#{user.last_name}".downcase
    user.projects.create(name: name)
  end
end
