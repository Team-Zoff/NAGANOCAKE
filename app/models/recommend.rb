class Recommend < ApplicationRecord
  belongs_to :admin
  has_many :products
end
