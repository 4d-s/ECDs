class User::OrdersController < ApplicationController
  def new
  	@item_selects = current_user.item_selects
  	@order = Order.new
  end

  def create
  	@order = current_user.orders.new(order_params)
  	@order.user_id = current_user.id
  	@order.order_last_name = current_user.last_name
  	@order.order_first_name = current_user.first_name
  	@order.order_last_name = current_user.last_name
  	@order.order_phone_number = current_user.phone_number
  	@order.total = @sum
  	@order.save
  	flash[:notice] = "購入が完了しました。お買い上げありがとうございます！"
  	redirect_to root_path
  end

  def adress
  end

  def index
  end

  private
    def order_params
      params.require(:order).permit(:order_address, :delivery_status)
    end
end