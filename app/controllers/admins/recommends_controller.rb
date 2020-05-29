class Admins::RecommendsController < ApplicationController
  def create
    recommend = Admin.recommends.build(product_id: params[:product_id])
    recommend.save!
    redirect_back(fallback_location: admins_path)
  end

  def destroy
    Admin.recommends.find_by(product_id: params[:product_id]).destroy!
    redirect_back(fallback_location: admins_path)
  end
end
