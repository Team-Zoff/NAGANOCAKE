class Admins::GenresController < ApplicationController

	def new
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		 genre = genre.new(genre_params)
	 if  genre.save
	 	 redirect_to request.referer
	else redirect_to action: :new
	end
end
