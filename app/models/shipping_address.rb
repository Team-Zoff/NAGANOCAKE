class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :address, presence: true
  validates :address_name, presence: true
  validates :postal_code, presence: true, format: { with: /\A[a-z0-9]+\z/i }


end
