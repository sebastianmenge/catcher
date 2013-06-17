class User
  include Mongoid::Document
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

  def self.create_user(data)
    user = User.create(data)
    if user.save
      session[:user_id] = user.id
    end
    user
  end

  def self.find_by_facebook_uid(uid)
    User.where(facebook_uid: uid).first
  end
end
