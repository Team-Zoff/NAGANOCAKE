class Members::OrdersController < ApplicationController

  def index
    @member = current_member
    @orders = @member.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_detail
  end

end
