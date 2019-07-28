 class Admin::GenresController < ApplicationController
  before_action :authenticate_administrator!
  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	redirect_to new_admin_item_path
    else
    flash[:notice] = "登録名が空欄です。"
    redirect_to new_admin_genre_path
    end
  end

  private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end

end
