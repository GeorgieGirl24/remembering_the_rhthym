class User < ApplicationRecord
  has_secure_password
  has_many :photos

  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email
end
