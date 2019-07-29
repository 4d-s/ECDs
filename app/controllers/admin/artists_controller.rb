class Admin::ArtistsController < ApplicationController
	before_action :authenticate_administrator!

	@@backurl = nil

	def new
		@artist = Artist.new
	end

	def edit
    	@artist = Artist.find(params[:id])
    	@@backurl = request.query_parameters[:backurl]
  	end

	def create
		@artist = Artist.new(artist_params)
		if  @artist.save
			flash[:notice] = "アーティスト名を登録しました。"
			redirect_to new_admin_item_path
		else
			flash[:notice] = "登録名が空欄です。"
			redirect_to new_admin_artist_path
		end
	end
	def update
	    @artist = Artist.find(params[:id])
	    if @artist.update(artist_params)
	      flash[:notice] = "アーティスト名を変更しました。"
	    	if @@backurl.blank?
	      		redirect_to  edit_admin_artist_path
	    	else
	    		redirect_to  @@backurl
	    	end
	    else
	      flash[:notice] = "登録名が空欄です。"
	      redirect_to  edit_admin_artist_path
	    end
  	end
	private
	def artist_params
    	params.require(:artist).permit(:artist_name)
	end
end
