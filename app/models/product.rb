class Product < ApplicationRecord
	belongs_to :genre

	validates :genre_id, presence: true
    validates :product_name, presence: true
    validates :description, presence: true
    validates :product_image_id, presence: true
    validates :price_exculuding_tax, presence: true
    validates :sale_status, presence: true

    attachment :product_image_id

end
