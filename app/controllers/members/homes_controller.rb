class Members::HomesController < ApplicationController
  def top
  	@product =  Product.where(sale_status: 'sale')
    @products = @product.order("RANDOM()").limit(3)
    @genres = Genre.all
  end
end
