class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
    @orders = current_customer.orders.page(params[:page])
    @item = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
    @total_money = 0
  end

  def confirm
    @total_money = 0
    @order = Order.new(order_params)
     if params[:selected_address] == "radio1"
           @order.postal_code = current_customer.postal_code
           @order.address = current_customer.address
           @order.name = current_customer.last_name + current_customer.first_name
     elsif  params[:selected_address] == "radio2"
           @address = Address.find(params[:address][:address])
           @order.postal_code = @address.postal_code
           @order.address = @address.address
           @order.name = @address.name
     else #バリデーションチェック
     end
    @order.shipping_cost = 800
    @select_address = params[:order][:select_address]
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def complete
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    cart_items = current_customer.cart_items.all
  if @order.save
    current_customer.cart_items.all.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.item_id = cart_item.item_id
    order_detail.order_id = @order.id
    order_detail.amount = cart_item.amount
    order_detail.price = cart_item.item.price
    order_detail.save
  end
    redirect_to public_orders_complete_path
    cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
  end


  def order_params
    params.require(:order).permit( :payment_method, :postal_code, :address, :name ,:total_payment ,:shipping_cost)
  end


end
