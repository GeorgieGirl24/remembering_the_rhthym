class Photo < ApplicationRecord
  has_one_attached :concert_photo
  belongs_to :user
  belongs_to :concert
  has_many :photo_tags
  has_many :tags, through: :photo_tags

  validates :name, presence: true
  validates :concert_date, presence: true
  validates :loved, inclusion: [true, false]
  validates :liked, inclusion: [true, false]

  def find_concert(concert_id)
    binding.pry
    self.find(concert_id).name
  end
end
