class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all
    @new_items = Item.last(4)
  end
  
  def about
    
  end
  
end
