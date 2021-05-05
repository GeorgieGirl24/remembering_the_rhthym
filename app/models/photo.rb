class Photo < ApplicationRecord
  has_one_attached :concert_photo
  belongs_to :user
  belongs_to :concert
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags, dependent: :destroy

  validates :name, presence: true
  validates :concert_date, presence: true
  validates :loved, inclusion: [true, false]
  validates :liked, inclusion: [true, false]
end
