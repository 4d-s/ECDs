class User::OrdersController < ApplicationController
  before_action :authenticate_user!
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
  		if session[:last_address] == nil
  			flash[:notice] = "配送先が指定されていません"
  			redirect_to new_user_order_path
  			return
  		else
	  	  @new_address = Address.last
	      @order.order_last_name = @new_address.last_name
	      @order.order_first_name = @new_address.first_name
	      @order.order_postal_code = @new_address.postal_code
	      @order.order_address = @new_address.street_address
	      @order.order_phone_number = @new_address.phone_number
  		end
  	end
  	@order.total = @sum
  	@order.delivery_status = 1
   if @order.save
    @item_selects.each{|item_select|
      @order_item_history = OrderItemHistory.new(order_id: @order.id)
      @order_item_history.item_name = item_select.item.item_name
      @order_item_history.item_price = item_select.item.price
      @order_item_history.image_id = item_select.item.image_id
      @order_item_history.order_item_count = item_select.item_count
      @order_item_history.save
    }
    @item_selects.destroy_all
    session[:last_address] = nil
    flash[:notice] = "購入が完了しました。お買い上げありがとうございます！"
    redirect_to root_path
  else
    flash[:notice] = "購入できませんでした"
    redirect_to new_user_order_path
  end
end

def address
 @new_address = Address.new
end

def create_address
  @new_address = Address.new(address_params)
  @new_address.user_id = current_user.id
  if @new_address.save
    session[:last_address] = @new_address.street_address
  	redirect_to new_user_order_path
  else
    session[:last_address] = nil
    redirect_to new_user_order_path
  end
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
