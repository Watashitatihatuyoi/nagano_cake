class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    @items = Item.all
    @new_items = Item.last(4)
  end
  
  def about
    
  end
  
end
