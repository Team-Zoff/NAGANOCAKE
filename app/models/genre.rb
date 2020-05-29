class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  attachment :genre_image

  validates :name, presence: true
  validates :genre_image, presence: true
  enum valid_invalid:{Validity: 0, Invalid: 1}

end