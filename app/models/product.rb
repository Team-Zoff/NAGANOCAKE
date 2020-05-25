class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy

    attachment :product_image

    enum sale_status: {sale: 0, notsale: 1}

	validates :genre_id, presence: true
    validates :product_name, presence: true
    validates :description, presence: true
    validates :product_image, presence: true
    validates :price_excluding_tax, presence: true
    validates :sale_status, presence: true

end
