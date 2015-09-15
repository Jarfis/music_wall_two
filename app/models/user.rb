class User < ActiveRecord::Base
  has_secure_password
  has_many :tracks
  has_many :upvotes
  validates :username, presence: true, uniqueness: true
  validates :fname, :lname, :password_digest, presence: true
end