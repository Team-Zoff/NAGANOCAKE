class Admins::ProductsController < ApplicationController

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
		product = Product.new(product_params)
	    if params[:image]
 			product.product_image_id = "#{product_params.product_name}.jpg"
			image = params[:product_image_id]
			File.binwrite("public/product_image_id/#{@user.image_name}", image.read)
	    end

	    if product.save
	    	redirect_to action: :new, notice: 'Product was successfully created.'
	    else
	    	redirect_to root_path
	    end
	end

    private

    def product_params
        params.require(:product).permit(:product_image,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
    end

end
