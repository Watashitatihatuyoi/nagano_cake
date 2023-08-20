class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end 
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to request.referer
    else
      @order_items = @order.order_items
      render :show
    end
  end
  
  private
  
  def order_params
    params.require[:order].permit[:status]
  end
  
end
