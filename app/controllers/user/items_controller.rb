class User::ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(12).reverse_order
  end

  def show
  	@item = Item.find(params[:id])
  end
end
