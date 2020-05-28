class Admins::RecommendController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    recommended = Admin.recommend.new(product_id: product_id)
    recommend.save
    redirect_back(fallback_location: admins_path)
  end

  def destroy
    product = Product.find(params[:product_id])
    recommended = Admin.recommend.find_by(product_id: product_id)
    recommend.destroy
    redirect_back(fallback_location: admins_path)
  end
end
