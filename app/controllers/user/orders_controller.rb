class User::OrdersController < ApplicationController
  def new
  	@item_selects = current_user.item_selects
  	@order = Order.new
  end

  def create
  	@sum = 0
  	@item_selects = current_user.item_selects
  	@item_selects.each{|item_select|
  		@sum += item_select.item.price * item_select.item_count
	}
	@sum += 500
	@order = current_user.orders.new(order_params)
  	@order.user_id = current_user.id
  	if params[:order][:address_select] == "0" then
  		@order.order_last_name = current_user.last_name
  		@order.order_first_name = current_user.first_name
  		@order.order_postal_code = current_user.postal_code
  		@order.order_address = current_user.street_address
  		@order.order_phone_number = current_user.phone_number
  	elsif params[:order][:address_select] == "1" then
  		@address = Address.find(params[:order][:address_id])
  		@order.order_last_name = @address.last_name
  		@order.order_first_name = @address.first_name
  		@order.order_postal_code = @address.postal_code
  		@order.order_address = @address.street_address
  		@order.order_phone_number = @address.phone_number
  	elsif params[:order][:address_select] == "2" then
  	end

  	@order.total = @sum
  	@order.delivery_status = 1
  	@order.save
  	flash[:notice] = "購入が完了しました。お買い上げありがとうございます！"
  	redirect_to root_path
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

  def order_params
      params.require(:order).permit(:order_address, :payment)
  end

  def address_params
    params.require(:address).permit(:last_name, :first_name, :street_address, :postal_code, :phone_number)
  end
end
