class User::UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
		redirect_to mypage_path(current_user)
		else
		flash[:notice] = "編集の更新に失敗しました"
		redirect_to mypage_edit_path(current_user)
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :phone_number, :postal_code, :email, :is_delete, :password )
	end
end