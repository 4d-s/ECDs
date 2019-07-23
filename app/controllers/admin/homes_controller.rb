class Admin::HomesController < ApplicationController
	before_action :authenticate_administrator!
	def top
	end
end
