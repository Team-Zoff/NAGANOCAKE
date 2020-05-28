class Members::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
     @order = Order.find(params[:id])
     @order_detail = @order.order_details
     @order.shipping_free = 800
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
    @cart_items = CartItem.all #カートの情報すべて取得
    @shipping_free = 800
    @order = Order.new
    if params[:address_status] == "1"
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = current_member.postal_code
      @order_address_name = current_member.last_name_kana
      @order_address = current_member.address
    elsif params[:address_status] == "2"
      shipping_address = ShippingAddress.find(params[:id])
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = shipping_address.postal_code
      @order_address_name = shipping_address.address_name
      @order_address = shipping_address.address
    elsif params[:address_status] == "3"
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = params[:new_postal_code]
      @order_address_name = params[:new_address_name]
      @order_address = params[:new_address]
    end
  end

  def create
    # shipping_addressに保存
    # if @address_status == 3
	  #   @address = ShippingAddress.new(method_of_payment: params[:method_of_payment], address_name: params[:address_name], postal_code: params[:postal_code], address: params[:address])
	  # 	@address.postal_code.save
    # end


    # orderテーブルに保存
    @order = Order.new
    @order.method_of_payment =  params[:order][:method_of_payment]
    @order.postal_code = params[:order][:postal_code]
    @order.address_name = params[:order][:address_name]
    @order.address = params[:order][:address]
    @order.member_id = current_member.id
    # binding.pry
    @order.save

    # OrderDetailテーブルに保存
    current_member.cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.order_id = @order.id
    order_detail.product_id = cart_item.product_id
    order_detail.price = cart_item.product.price_excluding_tax
    order_detail.purchase_quantity = cart_item.number_of_products
    order_detail.save
	end

    # cart_items削除処理
    current_member.cart_items.destroy_all

    # thanks Pageに飛びます
    redirect_to members_order_thanks_path
  end

  def thanks
  end

 #  private
	# def order_params
	# 	params.permit(:address_status)
	# end
end
