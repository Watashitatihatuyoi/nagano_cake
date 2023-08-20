class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to request.referer
    else
      @order = Order.find(params[:order_id])
      render 'orders/show'
    end
  end
  
  private
  
  def order_item_params
    params.require[:order_item].permit[:making_status]
  end
  
end
