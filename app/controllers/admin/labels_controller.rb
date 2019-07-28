  class Admin::LabelsController < ApplicationController
before_action :authenticate_administrator!
	def new
		@label = Label.new
	end

	def create
		@label = Label.new(label_params)
		if @label.save
			flash[:notice] = "レーベル名を登録しました。"
			redirect_to new_admin_item_path
		else
			flash[:notice] = "登録名が空欄です。"
			redirect_to new_admin_label_path
		end
	end

	private

	def label_params
		params.require(:label).permit(:label_name)
	end
end
