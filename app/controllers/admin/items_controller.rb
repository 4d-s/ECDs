class Admin::ItemsController < ApplicationController

  def index
  	@items = Item.page(params[:page]).per(3).reverse_order
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
      item = Item.new(item_params)
      item.save
      redirect_to admin_path
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :stock, :price, :is_sold, :image_id, :order_count)
  end
end