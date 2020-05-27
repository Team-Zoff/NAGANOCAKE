class Members::OrdersController < ApplicationController

  def index
  end

  def show
     @order = Order.find(params[:id])
     @order_detail = @order.order_details
     @total = 0
     @order_detail.each do |order|
       @total += (order.product.price_excluding_tax * order.purchase_quantity * 1.1).to_i
   end
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
  	@shipping_free = 800
    if params[:addres_status] == 1
      @order = Order.new(method_of_payment: params[:credit_payment], address_name: params[:current_user.first_name], postal_code: params[:current_member.postal_code], address: params[:current_member.address])
    elsif params[:page_id] == 2
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:shipping_address.address_name], postal_code: params[:shipping_address.postal_code], address: params[:shipping_address.address])
    elsif params[:page_id] == 3
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:shipping_address.address_name], postal_code: params[:shipping_address.postal_code], address: params[:shipping_address.address])
    end


  end

  def create
    # shipping_addressに保存
    # if @address_status == 3
	  #   @address = ShippingAddress.new(method_of_payment: params[:method_of_payment], address_name: params[:address_name], postal_code: params[:postal_code], address: params[:address])
	  # 	@address.postal_code.save
    # end

    # orderテーブルに保存
    @order = Orders.new
    @order.method_of_payment =  params[:order][:method_of_payment]
    @order.postal_code = params[:order][:postal_code]
    @order.address_name = params[:order][:address_name]
    @order.address = params[:order][:address]
    @order.member_id = current_user.id
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
