class Members::ProductsController < ApplicationController
  def index
  	@products = Product.all
    @genres = Genre.all
  end

  def show
    @products = Product.find(params[:id])
    @cart_items = CartItem.new
  end

end
