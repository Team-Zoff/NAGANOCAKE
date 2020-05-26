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
  	@shipping_addresses = ShippingAddress.where(member_id: current_member.id)
  	@address_status = params[:address_status]
  	# @shipping_address = ShippingAddress.find(params[:order][:postal_code])
  	# @postal_code = @shipping_address.postal_code
  	# @address = @shipping_address.address
  	# @address_name = @shipping_address.address_name
  end

  def confirmation
    if params[:addres_status] == 1
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:current_user.first_name], postal_code: params[:current_member.postal_code], address: params[:current_member.address])
    elsif params[:page_id] == 2
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:shipping_address.address_name], postal_code: params[:shipping_address.postal_code], address: params[:shipping_address.address])
    elsif params[:page_id] == 3
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:shipping_address.address_name], postal_code: params[:shipping_address.postal_code], address: params[:shipping_address.address])
    end


  end

  def create
    # orderテーブルに保存

    # if @address_status == 3
	   #  @address = ShippingAddress.new
	  	# @address.postal_code = params[:new_postal_code]
	  	# @address.postal_code.save

	  	# @address.address_name = params[:new_address_name]
	  	# @address.address_name

    @order = Orders.new(method_of_payment: params[:method_of_payment], address_name: params[:address_name], postal_code: params[:postal_code], address: params[:address])
    @order.member_id = current_user.id
    @order.order_status = 0 ;
    @order.save

    # OrderDetailテーブルに保存
    current_user.cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.order_id = @order.id
    order_detail.product_id = cart_item.product_id
    order_detail.price = cart_item.product.price_excluding_tax
    order_detail.purchase_quantity = cart_item.number_of_products
    order_detail.save
	end

    # cart_items削除処理
    current_user.cart_items.destroy_all

    # thanks Pageに飛びます
    redirect_to members_orders_thanks_path
  end

  def thanks
  end

 #  private
	# def order_params
	# 	params.permit(:address_status)
	# end
end
