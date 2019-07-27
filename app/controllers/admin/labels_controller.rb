  class Admin::LabelsController < ApplicationController
before_action :authenticate_administrator!
	def new
		@label = Label.new
	end

	def create
		@label = Label.new(label_params)
		if @label.save
		   redirect_to new_admin_item_path
		else
		   flash[:notice] = "登録できません。"
    	   redirect_to new_admin_label_path
    	end
	end

	private

	def label_params
		params.require(:label).permit(:label_name)
	end
end
