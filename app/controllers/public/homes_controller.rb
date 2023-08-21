class Public::HomesController < ApplicationController
  
  def top
<<<<<<< HEAD
    @items = Item.all
    @new_items = Item.first(4)
=======
    @items = Item.order(created_at: :desc).limit(4)
>>>>>>> 0310efc715170ccbfab2632641a546e6a6b3d14d
  end
  
  def about
    
  end
  
end
