class Admins::ProductsController < ApplicationController

	def new
		@product = Product.new

	end

	def create
		product = Product.new(product_params)
		product.save
	end

	    private
    def product_params
        params.require(:product).permit(:product_image_id,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
    end

end
