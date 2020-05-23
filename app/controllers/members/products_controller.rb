class Members::ProductsController < ApplicationController
  def index
    @genres = Genres.find(params[:genres_id])
    @products = @genres.products
  end

  def show
    @products = Products.find(params[:id])
    @cart_items = CartItems.new
  end

end
