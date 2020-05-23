class Members::HomesController < ApplicationController
  def top
    @products = Products.all
  end

  def about
  end
end
