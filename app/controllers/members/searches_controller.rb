class Members::SearchesController < ApplicationController
  def search
    @genres = Genre.all
    @how_search = params[:choice]
    @content = params[:search]
    @products = Product.search(params[:search], @how_search)
  end
end
