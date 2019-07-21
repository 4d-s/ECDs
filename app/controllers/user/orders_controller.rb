class User::OrdersController < ApplicationController
  def new
  end

  def address
  	@new_address = Address.new
  end

  def create_address
  	@new_address = Address.new(address_params)
    @new_address.user_id = current_user.id
    @new_address.save
    render :new
  end

  def index
  	@user = current_user
  	@orders = @user.orders
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :street_address, :postal_code, :phone_number)
  end

end
