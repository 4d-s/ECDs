class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	# @user = User.find(params[:id])
  	#  flag = params[:is_deleted]
  	#  if flag == 'false'
  	#  	@user.update_attribute(:is_deleted, params[:is_deleted])
  	#  	redirect_to admin_users_path
  	#  elsif flag == 'true'
  	#  	@user.update_attribute(:is_deleted, params[:is_deleted])
  	#  	redirect_to admin_users_path
  	#  else
      binding.pry
  		@user = User.find(params[:id])
  		@user.update(user_params)
  		redirect_to root_path
  	end


  private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :postal_code, :phone_number, :email, :password, :is_deleted)
	end
end
