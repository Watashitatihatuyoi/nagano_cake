class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    @items = Item.all
    @total_items = @items.count
  end
  
  def show
    
  end
  
end
