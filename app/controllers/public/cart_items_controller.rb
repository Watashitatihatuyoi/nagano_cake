class Public::CartItemsController < ApplicationController
  
  def index
    if current_customer
      @cart_items = current_customer.cart_items.all
      @items = Item.all
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
    @cart_item = CartItem.fimnd(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "削除されました。"
  end 
  
  def destroy_all_records
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: "全てのカート内商品が削除されました。"
  end
  
  def create
    
  end 
  
  
end
