class Members::OrdersController < ApplicationController

  def index
    @member = current_member
    @orders = @member.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_detail
  end

  def purchase_information
  	@order = Order.new
  	@shipping_addresses = ShippingAddress.all
  	@shipping_address = Shipping_address.find(params[:order][:postal_code])
  	@order.address = @shipping_address.address
  	@order.address = @shipping_address.address

  end
end
