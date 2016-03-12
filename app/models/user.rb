class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
  	[
  		:first_name,
  		[:first_name, :last_name],
  		[:first_name, :last_name, :created_at]
  	]
  end
  has_secure_password
  has_many :classifieds

  validates :slug, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def to_s
  	"#{first_name} #{last_name}"
  end
end
