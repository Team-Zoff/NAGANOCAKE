class Admins::ProductsController < ApplicationController

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
		product = Product.new(product_params)
	    if product.save
	    	flash[:notice] = "Product was successfully created."
	    	redirect_to action: :new
	    else
	    	@product = Product.new
	    	render :new
	    end
	end

	private
<<<<<<< HEAD
    def product_params
        params.require(:genre).permit(:product_name,:description,:price_excluding_tax,:sale_status)
=======

    def product_params
        params.require(:product).permit(:product_image,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
>>>>>>> b72dd2bc23254e452e99fd3e1e292e39e617a80c
    end

end
