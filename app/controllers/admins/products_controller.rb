class Admins::ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
		@product = Product.new(product_params)
	    if @product.save
	    	flash[:notice] = "商品登録完了しました！"
	    	redirect_to admins_product_path(product)
	    else
	    	@product = Product.new
	    	render :new
	    end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = "商品情報変更成功しました！"
		 	redirect_to action: :show
	    else
	    	@product = Product.find(params[:id])
	    	render :edit
	    end
	end

	private
    def product_params
    	params.require(:product).permit(:product_image,:product_name,:description,:genre_id,:price_excluding_tax,:sale_status)
		end
end
