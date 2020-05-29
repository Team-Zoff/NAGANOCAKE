class Members::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    # リロードされた際にpurchase_informationに戻る
    if params[:id] == 'confirmation'
      redirect_to members_order_purchase_path
      return
    end
     @order = Order.find(params[:id])
     @order_detail = @order.order_details
     @order.shipping_free = 800
     @total = 0
     @order_detail.each do |order|
       @total += (order.product.price_excluding_tax * order.purchase_quantity * 1.1).to_i
     end
  end

  def purchase_information

    # カートの中身が空だった場合にcart_items/indexに戻る
    unless CartItem.where(member_id: current_member).exists?
      @message = "お買い物カートの中身がからの状態です!!"
      @cart_items = CartItem.all #カートの情報すべて取得
      @total = 0
      @cart_items.each do |item|
        @total += (item.product.price_excluding_tax * item.number_of_products * 1.1).to_i
      end
      render 'members/cart_items/index'
      return
    end
    # byebug

  	@order = Order.new
  	@shipping_addresses = ShippingAddress.where(member_id: current_member.id)
  	@address_status = params[:address_status]

  end

  def confirmation
    @order = Order.new
    @cart_items = CartItem.all #カートの情報すべて取得

    # purchase_informationからデータの受け取り
    if params[:address_status] == "1"
      @address_status = "1"
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = current_member.postal_code
      @order_address_name = current_member.last_name_kana
      @order_address = current_member.address
    elsif params[:address_status] == "2"
      @address_status = "2"
      shipping_address = ShippingAddress.find(params[:address_collection])
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = shipping_address.postal_code
      @order_address_name = shipping_address.address_name
      @order_address = shipping_address.address
    elsif params[:address_status] == "3"
      @address_status = "3"
      @method_of_payment =  params[:method_of_payment]
      @order_postal_code = params[:new_postal_code]
      @order_address_name = params[:new_address_name]
      @order_address = params[:new_address]
    end

  end

  def create
    @address_status = params[:address_status]
    # orderテーブルに保存
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.order_status = 0
    @order.confirmed_purchase_price = params[:order][:confirmed_purchase_price]
    unless @order.save
      @cart_items = CartItem.all
     render :confirmation
     return
    end


    # shipping_addressに保存
    if params[:address_status] == '3'
      @shipping_address = ShippingAddress.new
      @shipping_address.address_name = params[:order][:address_name]
      @shipping_address.postal_code = params[:order][:postal_code]
      @shipping_address.address = params[:order][:address]
      @shipping_address.member_id = current_member.id
      @shipping_address.save
    end


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

  private
  def order_params
    params.require(:order).permit(:method_of_payment,:postal_code,:address_name,:address)
  end

end
