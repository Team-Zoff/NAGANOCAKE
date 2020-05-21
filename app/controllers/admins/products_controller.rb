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
        params.require(:genre).permit(:name,:)
    end

end
