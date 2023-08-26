class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page])
  end 
  
  def new
    @item = Item.new
    @genres = Genre.pluck(:name, :id)
  end 
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.pluck(:name, :id)
      render new_admin_item_path
    end
  end 
  
  def show
    @item = Item.find(params[:id])
  end 
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.pluck(:name, :id)
  end 
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end 
  
  
  private
  
  def item_params
    params.require(:item).permit(:item_image, :name, :explanation, :price, :genre_id, :is_active)
  end
  
end
