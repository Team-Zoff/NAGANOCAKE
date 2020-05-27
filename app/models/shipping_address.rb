class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :address, presence: true
  validates :address_name, presence: true
  validates :postal_code, presence: true, format: { with: /\A[a-z0-9]+\z/i }

 def full_address
 	"#{self.postal_code} #{self.address} #{self.address_name}"
 end
end
