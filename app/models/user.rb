class User
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :create_initial_content

  field :first_name, type: String
  field :last_name, type: String
  field :facebook_uid, type: Integer
  field :email, type: String
  field :birthday, type: Date
  field :locale, type: String
  field :timezone, type: String
  field :oauth_token, type: String
  field :token_expires_at, type: Integer
  field :signed_request, type: String

  validates_uniqueness_of :email
  validates_presence_of :email

  has_many :projects, dependent: :destroy

  def self.create_user(data)
    User.create(data)
  end

  def self.find_by_facebook_uid(uid)
    User.where(facebook_uid: uid).first
  end

  private

  def create_initial_content
    Project.create_initial_for_user(self)
    Group.create_initial_for_user(self)
  end
end
