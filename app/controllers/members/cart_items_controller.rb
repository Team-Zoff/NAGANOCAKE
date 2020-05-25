class Members::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all #カートの情報すべて取得
    @total = total(current_member.cart_items)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    @cart_item.save
    redirect_to members_cart_items_path
  end

  def update
    @cart_item = CartItem.find(cart_item_id)
    @cart_item.update(cart_item_params)
    redirect_to "index"
  end

  def destroy
    @cart_item = CartItem.find(cart_item_id)
    @CartItem.member == current_member
    @cart_item.destroy
    redirect_back(fallback_location: members_path)
  end

  def destroy_all
    current_member.cart_items.destroy_all
    redirect_to members_products_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:member_id,:product_id,:number_of_products)
  end

  def total(cart_items)
		total = 0
		cart_items.each do |item|
			total += item.subtotal
		end
		return @total
	end
end
