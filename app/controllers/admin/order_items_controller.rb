class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.find(params[:id])
    @order_items = @order.order_items.all
    if @order_item.update(order_item_params)
      if @order_items.exists?(making_status: 2)
        @order.update(status: 2)
      elsif @order_items.where(making_status: 3).count == @order_items.count
        @order.update(status: 3)
      end
      redirect_to request.referer
    else
      render 'orders/show'
    end
  end
  
  private
  
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
  
end
