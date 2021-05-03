class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :concert

  validates :name, presence: true
  validates :concert_date, presence: true
  validates :loved, inclusion: [true, false]
  validates :liked, inclusion: [true, false]
end
