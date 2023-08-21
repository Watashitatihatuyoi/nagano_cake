class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all
    @new_items = Item.first(4)
  end
  
  def about
    
  end
  
end
