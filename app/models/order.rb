class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	belongs_to :member

	enum method_of_payment: {銀行決済: 0, クレジットカード決済: 1}
	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
