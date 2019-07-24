class Admin::OrdersController < ApplicationController
before_action :authenticate_administrator!
  def index
  	@orders = Order.all
  end

  def show
  	@user = User.find(params[:id])
  	@orders = @user.orders
  end

  def edit
  	@order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "発送ステータスを更新完了"
    redirect_to admin_orders_path
  end

  private
  def user_params
  params.require(:user).permit(:name, :last_name, :first_name, :street_address, :postal_code, :phone_number)
  end

  def order_params
    params.require(:order).permit(:delivery_status)
  end
end
