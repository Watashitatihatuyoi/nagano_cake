class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end 
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_select] == 'own_address'
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:address_select] == 'registered_address'
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_select] == 'new_address'
      @order = Order.new(order_params)
    end
    @cart_items = current_customer.cart_items.all
  end 
  
  def complete
    
  end 
  
  def create
    
  end 
  
  def index
    
  end 
  
  def show
    
  end
  
  private
  
  def order_params
    params.require[:order].permit[:payment_method, :post_code, :address, :name]
  end
  
end
