class Admins::OrdersController < ApplicationController
	def index
		if params[:page_id] == 1
			@orders = Order.all
		elsif params[:page_id] == 2
			@orders = Order.where('created_at > ?', 1.day)
		else
			@orders = Order.all
			#該当顧客のデータ　あとで作ります
		end

		# link_to hogehoge_path(page_id: 1)
		# link_to hogehoge_path, page_id: 1
	end
	def show
		#@order_member = Order.find(params[:id])
	end
end
