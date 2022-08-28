class Public::CustomersController < ApplicationController
  # マイページ
  def show
    @customer = current_customer
  end
  
  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      flash[:success] = "個人情報を編集しました"
      redirect_to public_customer_path(current_customer.id)
    else
      flash[:danger] = '個人情報の編集に失敗しました'
      render :edit
    end
  end
  
  def quit
    @customer = current_customer
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :email)
  end
  
end
