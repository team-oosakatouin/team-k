class Public::AddressesController < ApplicationController
def index
  @address = Address.new
  @addresses = current_customer.addresses
end

def create
  @address= Address.new(address_params)
  @address.customer_id = current_customer.id
  if @address.save
    flash[:success] = '配送先を登録しました'
    redirect_to public_addresses_path
  else
    flash[:danger] = '必要情報を入力してください／ハイフンは使用できません'
    @address = Address.new
    @addresses = current_customer.addresses
    render :index
  end
end

def edit
  @address = Address.find(params[:id])
end

def update
  address = Address.find(params[:id])
    if address.update(address_params)
      flash[:success] = '編集を保存しました'
      redirect_to public_addresses_path
    else
      @address = Address.find(params[:id])
      flash[:danger] =
        '必要情報を入力してください／ハイフンは使用できません'
      render "public/addresses/edit"
    end
end


def destroy
  @address = Address.find(params[:id])
  @address.destroy
  flash[:success] = '削除しました'
  redirect_to public_addresses_path
end

 private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
