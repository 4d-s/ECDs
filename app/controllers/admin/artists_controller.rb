class Admin::ArtistsController < ApplicationController
	before_action :authenticate_administrator!
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if  @artist.save
			redirect_to new_admin_item_path
		else
			flash[:notice] = "登録できません。"
			redirect_to new_admin_artist_path
		end
	end
	private
	def artist_params
    	params.require(:artist).permit(:artist_name)
	end
end
