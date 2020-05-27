class Admins::OrdersController < ApplicationController
	def index
		if params[:page_id] == 1
			@orders = Order.all
		elsif params[:page_id] == 2
			@orders = Order.where('created_at > ?', 1.day)
		else
			@member = Member.find(params[:id])
			@orders = @member.orders
			#該当顧客のデータ　あとで作ります
		end


	end
	def show
		# @order_products = @orderer.order_details
		# @items = Order_detail.new(@order_products.each)

		@order = Order.find(params[:id])
		@order_details = @order.order_details
		# @products = []
		# @order_details.each do |order_detail|
		# 	@products.push(order_detail.product)
		# end
		# @products.each do |product|
		# 	product.name
		# end

	end
end
