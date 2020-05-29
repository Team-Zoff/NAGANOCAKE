class Admins::OrderDetailController < ApplicationController
	def edit
		@order = Order.find(params[:id])
		@order_details = @order.order_details.all
	end
	def update
		@order = Order.find(params[:id])
		@production_status = @order.order_details.production_status
		if @production_status.update(production_status_params)
			flash[:notice] = "商品ステータス更新しました！"
			redirect_to action: :show
		else
			render :show
		end
	end

	private
	def production_status_params
    	params.require(:order_detail).permit(:production_status)
	end
end
