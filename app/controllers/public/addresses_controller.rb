class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
     @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:address] = "新規配送先を登録しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index 
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    flash[:address_edit] = "配送先を編集しました。"
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:address_destroy] = "配送先を削除しました。"
    redirect_to addresses_path
  end

  def address_params
  params.require(:address).permit(:name, :post_code, :address)
  end

end
