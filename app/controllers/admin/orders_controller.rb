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

   def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     @order_details = @order.order_details
   if @order.status == "payment_comfirmation"
     @order_details.each do|order_detail|
     order_detail.making_status = "waiting_for_making"
     order_detail.save
   end
   end
     redirect_to admin_order_path(@order.id)
   end

   protected

 def order_params
  params.require(:order).permit(:postal_code, :name, :address, :shipping_cost, :total_payment, :payment_method, :status)
 end


end
