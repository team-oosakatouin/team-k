class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    #@orders = current_client.orders.all
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
  end
  
  def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end
  
  private

  def order_params
    params.require(:order).permit(:payment, :receive_name, :postal_code, :street_address)
  end

end
