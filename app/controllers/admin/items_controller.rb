class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
      flash[:notice] = "商品を登録しました"
    else
      flash[:notice] = "必要情報を入力してください"
      render action: :new
    end
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
    params.require(:item).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end

