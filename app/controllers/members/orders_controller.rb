class Members::OrdersController < ApplicationController

  def index
    @member = current_member
    @orders = @member.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_detail
  end

  def confirmation
    @order = Order.new(method_of_payment: params[:method_of_payment],address_name: params[:address_name],postal_code: params[:postal_code],address: params[:address])
    @member = current_user
    @cart_items = @member.cart_items
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
    current_user.cart_items.destroy

    # thanks Pageに飛びます
    redirect_to members_orders_thanks_path
  end

  def thanks
  end


end
