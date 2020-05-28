class Members::HomesController < ApplicationController
  def top
    @products = Product.all
    @genres = Genre.all
    #@recommended =
  end
end
