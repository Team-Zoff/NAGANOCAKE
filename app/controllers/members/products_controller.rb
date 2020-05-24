class Members::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    @products = @genres.products
  end

  def show
    @products = Product.find(params[:id])
    @cart_items = CartItem.new
  end

end
