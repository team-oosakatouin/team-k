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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item)
      flash[:notice_update] = "ジャンル情報を更新しました！"
    else
      redirect_to edit_admin_item_path(@item)
    end
  end

  private

  def item_params
    params.require(:iten).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end