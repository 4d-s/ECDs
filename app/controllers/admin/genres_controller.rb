class Admin::GenresController < ApplicationController
  def new
  	@genre = Genre.new
  end
  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to new_admin_item_path
  end

  private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end
end