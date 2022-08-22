class Admin::ItemsController < ApplicationController


  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item.params)
    @imte.save 
  end
  
  private

  def item_params
    params.require(:iten).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
