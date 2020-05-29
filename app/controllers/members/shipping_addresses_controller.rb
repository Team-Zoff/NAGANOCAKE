class Members::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @full_shipping_addresses = current_member.shipping_addresses
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.member_id = current_member.id
    if @shipping_address.save
      redirect_to members_shipping_addresses_path, notice: "配送先の登録に成功しました。"
    else
      @full_shipping_addresses = current_member.shipping_addresses
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
  	@shipping_address = ShippingAddress.find(params[:id])
  	if @shipping_address.update(shipping_address_params)
  		redirect_to members_shipping_addresses_path, notice: "配送先の更新に成功しました。"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render :edit
  	end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
  	@shipping_address.destroy
  	redirect_to members_shipping_addresses_path, notice: "配送先の削除に成功しました。"
  end

  private
  def shipping_address_params
  	params.require(:shipping_address).permit(:address_name, :postal_code, :address)
  end

end
