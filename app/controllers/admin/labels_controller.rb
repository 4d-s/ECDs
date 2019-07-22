class Admin::LabelsController < ApplicationController

	def new
		@label = Label.new
	end

	def create
		@label = Label.new(label_params)
		@label.save
		redirect_to new_admin_item_path
	end

	private

	def label_params
		params.require(:label).permit(:label_name)
	end
end
