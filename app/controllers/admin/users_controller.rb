class Admin::UsersController < ApplicationController
before_action :authenticate_administrator!
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
  	 @user = User.find(params[:id])
  	  flag = params[:is_deleted]
  	  if flag == 'false'
  	  	@user.update_attribute(:is_deleted, params[:is_deleted])
  	  	redirect_to admin_users_path
  	  elsif flag == 'true'
  	  	@user.update_attribute(:is_deleted, params[:is_deleted])
  	  	redirect_to admin_users_path
  	  else
  		@user = User.find(params[:id])
  		@user.update(user_params)
  		redirect_to admin_user_path(@user.id)
  	end
  end


  private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :postal_code, :phone_number, :email)
	end
end
