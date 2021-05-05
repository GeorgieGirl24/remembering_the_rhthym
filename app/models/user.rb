class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email
end
