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
      redirect_to admin_item(@item.id)
      flash[:notice] = "商品を登録しました"
    else
      flash[:notice] = "必要情報を入力してください"
      render action: :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price, :is_active)
  end
end
