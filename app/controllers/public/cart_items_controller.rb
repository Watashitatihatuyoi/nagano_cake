class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
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
    
  end 
  
  def destroy_all
    
  end
  
  def create
    
  end 
  
  
end
