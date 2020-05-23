class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  enum valid_invalid:{"有効":0,"無効":1}
end
