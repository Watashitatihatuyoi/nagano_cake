class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
    @items = Item.all
  end 
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: "Quantity updated successfully."
    else
      render :edit
    end
  end 
  
  def destroy
    @item = Item.fimnd(params[:id])
    @item.destroy
    redirect_to cart_items_path, notice: "削除されました。"
  end 
  
  def destroy_all_records
    Items.destroy_all
    redirect_to cart_items_path, notice: "全てのカート内商品が削除されました。"
  end
  
  def create
    
  end 
  
  
end
