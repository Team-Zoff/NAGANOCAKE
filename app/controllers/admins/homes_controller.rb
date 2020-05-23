class Admins::HomesController < ApplicationController
	def top
	  	@orders = Order.where('created_at > ?', 1.day)
	  	@number_of_orders = @orders.count
	end
end
