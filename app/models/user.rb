class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_secure_password
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum:50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
  					format: { with: VALID_EMAIL_REGEX }
  					#uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 } 
  has_many :microposts 

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  Bcrypt::Engine.cost
    Bcrypt::Password.create(string, cost)
  end

  def feed
    microposts
  end

end
