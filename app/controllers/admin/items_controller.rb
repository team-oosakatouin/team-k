class Admin::ItemsController < ApplicationController
  

  def index
    @books = Book.all

  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def create
    

  end
end
