class Admins::OrdersController < ApplicationController
	def index
		if params[:page_id] == "1"
			@orders = Order.page(params[:page]).reverse_order
		elsif params[:page_id] == "2"
			@orders = Order.where('created_at > ?', 1.day)
		else
			@member = Member.find(params[:member_id])
			@orders = @member.orders
			#該当顧客のデータ
		end

@orders = Order.page(params[:page]).reverse_order

	end
	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		

	end
	def update
		@order_status = Order.find(params[:id])
		if @order_status.update(order_status)
			flash[:notice] = "商品ステータス更新しました！"
			redirect_to action: :show
		else
			render :show
		end
	end

	private

	def order_status
	    params.require(:order).permit(:order_status)
	end
end
