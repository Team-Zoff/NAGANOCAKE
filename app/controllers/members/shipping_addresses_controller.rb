class Members::ShippingAddressesController < ApplicationController
  
  def index
    @member = current_member
    @shipping_addresses = @member.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_addresses = ShippingAddress.new(shipping_address_params)
    @shipping_addresses.member_id = current_user.id
    if @shipping_addresses.save
      redirect_to members_shipping_addresses_path, notice: "successfully created ShippingAddresses!"
    else
      redirect_to members_shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
  	@shipping_address = ShippingAddress.find(params[:id])
  	if @shipping_address.update(shipping_address_params)
  		redirect_to edit_members_shipping_address_path(@shipping_address), notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render :edit
  	end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
  	@shipping_address.destroy
  	redirect_to members_shipping_addresses_path, notice: "successfully delete ShippingAddresses!"
  end

  private
  def shipping_address_params
  	params.require(:shipping_addresses).permit(:address_name, :postal_code, :address)
  end

end
