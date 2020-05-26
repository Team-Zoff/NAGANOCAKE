class CartItem < ApplicationRecord
	belongs_to :member
	belongs_to :product

	def subtotal
		(self.product.price_excluding_tax * 1.1 * self.number_of_products).to_i
	end

	# def total
	# 	total = 0
	# 	current_member.cart_items.each do |item|
	# 		total += item.subtotal
	# 	end
	# 	return
	# end
end
