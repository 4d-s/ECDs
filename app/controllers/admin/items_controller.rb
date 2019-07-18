class Admin::ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(3).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
