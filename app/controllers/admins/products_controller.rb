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

    def product_params
        params.require(:product).permit(:product_image,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
    end

end
