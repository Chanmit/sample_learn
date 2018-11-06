class Micropost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  # embedded_in :user

  belongs_to :user, validate: false
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }
end
