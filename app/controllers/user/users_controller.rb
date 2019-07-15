class User::UsersController < ApplicationController


	def show
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		redirect_to mypage_path(@user.id)
	end
end
