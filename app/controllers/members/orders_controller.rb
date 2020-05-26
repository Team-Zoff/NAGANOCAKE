class Members::OrdersController < ApplicationController

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def purchase_information
  	@order = Order.new
  	@shipping_addresses = ShippingAddress.all
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
      @order = Order.new(method_of_payment: params[:method_of_payment], address_name: params[:order.address_name], postal_code: params[:order.postal_code], address: params[:order.address])
    end

  end

  def create
    # orderテーブルに保存
    @order = Orders.new(method_of_payment: params[:method_of_payment], address_name: params[:address_name], postal_code: params[:postal_code], address: params[:address])
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

end
