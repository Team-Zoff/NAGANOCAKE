class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	belongs_to :member
	
	validates :order_status, presence: true
	validates :address, presence: true
	validates :postal_code, presence: true
	validates :method_of_payment, presence: true
	validates :address_name, presence: true
	validates :postal_code, presence: true

	enum method_of_payment: {bank_payment: 0, credit_payment: 1}
	enum order_status: {unpaid: 0, paid: 1, producing: 2, preparing: 3, shipped: 4}

end
