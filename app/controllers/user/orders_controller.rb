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
    redirect_to new_user_order_path
  end

  def index
  end
end
