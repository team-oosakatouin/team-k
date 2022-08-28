class Admin::OrdersController < ApplicationController
   def index
    if params[:id] 
      @orders = Customer.find(params[:id]).orders.page(params[:page]).per(10)

    elsif request.fullpath.include? "today" 
      @orders = Order.where(created_at:  Time.zone.now.all_day).page(params[:page]).per(10)

    elsif request.fullpath.include? "yesterday" 
      @orders = Order.where(created_at: 1.day.ago.all_day).page(params[:page]).per(10)

    else
      @orders = Order.page(params[:page]).per(10)
    end
   end
   
   def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
   end
   
end
