class Admins::OrderDetailController < ApplicationController
	def update
		@production_status = Order.find(params[:id])
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
