class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    @items = Item.all
    @total_items = @items.count
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
  
end
