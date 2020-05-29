class Admins::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			flash[:notice] = "ジャンル登録完了しました！"
			redirect_to request.referer
		else
			flash[:notice] = "更新に失敗しました。入力を確認してください。"
			@genre = Genre.new
			@genres = Genre.all
			render :index
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			flash[:notice] = "ジャンルを更新しました！"
			redirect_to action: :index
		else
			flash[:notice] = "更新に失敗しました。入力を確認してください。"
			@genre = Genre.find(params[:id])
			render :edit
		end
	end

	    private
	def genre_params
        params.require(:genre).permit(:valid_invalid,:name,:genre_image)
    end

end
