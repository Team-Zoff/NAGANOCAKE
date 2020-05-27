class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  enum valid_invalid:{Validity: 0, Invalid: 1}
end
