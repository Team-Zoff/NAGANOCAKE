class Admins::OrdersController < ApplicationController
	class Admins::OrdersController < ApplicationController
	def index
        @path = Rails.application.routes.recognize_path(request.referer)
          if @path[:controller] == "application"
		     @orders = Order.all
		     #ヘッダーから遷移してきた時
		 elsif @path[:controller] == "admins/members"
		 	@order_member = Order.find(params[:id])
		 	@orders = @order_member.all
		 	#会員詳細から遷移してきた時
		 else @path[:controller] == "admins/homes"
		 	@orders_today = Order.where('created_at > ?', 1.day)
		 	@orders = @orders_today.all
		 end
	end
	def show
		#@order_member = Order.find(params[:id])
	end
end
end
