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
  	# @shipping_address = ShippingAddress.find(params[:order][:postal_code])
  	# @postal_code = @shipping_address.postal_code
  	# @address = @shipping_address.address
  	# @address_name = @shipping_address.address_name

  end
end
