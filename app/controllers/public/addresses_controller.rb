class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  def address_params
  params.require(:address).permit(:name, :post_code, :address)
  end

end
