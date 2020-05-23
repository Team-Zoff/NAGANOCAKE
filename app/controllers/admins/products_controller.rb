class Admins::ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		product = Product.new(product_params)
	 if product.save
	 	redirect_to action: :show
	 else
	 	@product = Product.new
	 	render action: :new
	 end
	end
	def index
	end
	    private
    def product_params
        params.require(:product).permit(:product_image,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
    end

end
