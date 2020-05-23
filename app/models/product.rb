class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy

    mount_uploader :product_image_id, ProductImageIdUploader
    attachment :product_image

	validates :genre_id, presence: true
    validates :product_name, presence: true
    validates :description, presence: true
    validates :product_image_id, presence: true
    validates :price_excluding_tax, presence: true
    validates :sale_status, presence: true


end
