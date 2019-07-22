class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@user = User.find(params[:id])
  	@orders = @user.orders
  end

  def edit
  end

  private
  def user_params
  params.require(:user).permit(:name, :last_name, :first_name, :street_address, :postal_code, :phone_number)
end
end
