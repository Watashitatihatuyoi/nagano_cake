class Public::CartItemsController < ApplicationController
  
  def index
    if current_customer
      @cart_items = current_customer.cart_items.all
    else
      flash[:notice] = "ログインしてください。"
      redirect_to new_customer_registration_path
    end
  end 
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "Quantity updated successfully."
    else
      render :edit
    end
  end 
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "削除されました。"
  end 
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: "全てのカート内商品が削除されました。"
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end 
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end
  
end
