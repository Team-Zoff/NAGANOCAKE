class Recommend < ApplicationRecord
  has_many :products
  belongs_to :admin
end
