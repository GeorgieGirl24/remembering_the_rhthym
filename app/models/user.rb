class User < ApplicationRecord
  has_many :photos

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates_uniqueness_of :email
end
