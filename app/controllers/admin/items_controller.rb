class Admin::ItemsController < ApplicationController
  
  def index
    @books = Book.all
  end
end
