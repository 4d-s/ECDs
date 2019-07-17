class User::UsersController < ApplicationController


	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user.id)
		@user.update(user_params)
		redirect_to mypage_path(current_user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address, :phone_number, :postal_code, :email, :is_delete, :password )
	end
end
