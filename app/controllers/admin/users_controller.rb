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
        flash[:notice] = "１名のお客様のアカウントを削除しました。"
  	  	redirect_to admin_users_path
  	  elsif flag == 'true'
  	  	@user.update_attribute(:is_deleted, params[:is_deleted])
        flash[:notice] = "１名のお客様のアカウントを復元しました。"
  	  	redirect_to admin_users_path
  	  else
  		@user = User.find(params[:id])
    		if @user.update(user_params)
          flash[:notice] = "プロフィール内容を変更しました。"
    		  redirect_to admin_user_path(@user.id)
        else
          flash[:notice] = "ユーザー情報に不備があります"
          redirect_to edit_admin_user_path(@user.id)
    	  end
      end
  end


  private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :postal_code, :phone_number, :email, :password, :is_deleted)
	end
end
