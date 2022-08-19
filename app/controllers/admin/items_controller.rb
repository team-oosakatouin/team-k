class Admin::ItemsController < ApplicationController
  

  def index
    @books = Book.all

  def new
    @item = Item.new
  end
  
  def create
    

  end
end
