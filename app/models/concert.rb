class Concert < ApplicationRecord
  # has_many :photos

  validates :band_name, presence: true
  validates :venue, presence: true
  validates :concert_date, presence: true
end
