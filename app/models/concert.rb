class Concert < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :user_concerts, dependent: :destroy
  has_many :users, through: :user_concerts, dependent: :destroy

  validates :band_name, presence: true
  validates :venue, presence: true
  validates :concert_date, presence: true
end
