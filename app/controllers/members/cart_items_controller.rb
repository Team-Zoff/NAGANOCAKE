class Members::CartItemsController < ApplicationController
  def index
    @member = current_user
    @cart_items = @member.cart_items
  end

  def create
    @cart_items = CartItems.new(cart_items_params)
    @cart_items.member_id = current_user.id
    if @cart_items.save
      redirect_to members_cart_items_path
    else
      @products = Products.find(id: @cart_items.product_id)
      members_product_path(@products)
  end

  def update
  end

  def destroy

  end

  def destroy_all

  end

  private
  def cart_items_params
  	params.require(:cart_items).permit(:number_of_products,:product_id)
  end

end
