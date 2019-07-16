class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])

  end

  def edit
  end

  def update
  end

  private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :postal_code, :phone_number, :email, :password, :is_deleted)
	end
end
