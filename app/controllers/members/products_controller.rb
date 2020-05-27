class Members::ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @genres.each do |genre|
      @genre = genre
    end
    @products = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def product_params
    params.require(:product).permit(:genre_id,:product_name,:product_image_id,:price_excluding_tax)
  end
end
