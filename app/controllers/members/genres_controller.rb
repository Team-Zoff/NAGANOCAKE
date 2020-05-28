class Members::GenresController < ApplicationController
	def show
	    @genre = Genre.find(params[:id])
	    @genres = Genre.all
	    @products = Product.all
	end
end
