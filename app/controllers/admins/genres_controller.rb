class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new
		if @genre.save(genre_params)
			flash[:notice] = "ジャンル登録完了しました！"
     	    redirect_to request.referer
		else
	  		redirect_to request.referer
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		genre = Genre.find(params[:id])
		if genre.update(genre_params)
			flash[:notice] = "ジャンルを更新しました！"
			redirect_to action: :index
		else
			@genre = Genre.find(params[:id])
			render :edit
		end
	end

	    private
	def genre_params
        params.permit(:valid_invalid,:name)
    end

end
