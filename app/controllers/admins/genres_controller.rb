class Admins::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
           genre = Genre.new(genre_params)
	  if   genre.save
     	   redirect_to request.referer,notice: 'Genre was successfully created.'
	  else redirect_to request.referer
	  end
	end

	    private
	def genre_params
        params.require(:genre).permit(:valid_invalid,:name)
    end

end
