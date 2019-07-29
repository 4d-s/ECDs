class User::AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @addresses = @user.addresses
  end

  def new
    @new_address = Address.new
  end

  def edit
    @edit_address = Address.find(params[:id])
  end

  def create
    @new_address = Address.new(address_params)
    @new_address.user_id = current_user.id
    if @new_address.save
      flash[:notice] = "新しい住所を追加しました。"
      redirect_to user_addresses_path
    else
      flash.now[:notice] = "アドレス情報に不備があります。"
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "アドレス情報の更新をしました。"
      redirect_to user_addresses_path
    else
      flash[:notice] = "アドレス情報に不備があります"
      redirect_to edit_user_address_path(params[:id])
    end
  end

  def destroy
    @destroy_address = Address.find(params[:id])
    @destroy_address.destroy
    flash[:notice] = "アドレス情報を削除しました"
    redirect_to user_addresses_path
  end

    private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :street_address, :postal_code, :phone_number)
  end

end
