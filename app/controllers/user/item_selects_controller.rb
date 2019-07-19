class User::ItemSelectsController < ApplicationController

  def index
    @item_selects = ItemSelect.all
  end

  def create
    @item = Item.find(params[:item_id])
    @item_select = current_user.item_selects.new(item_id: @item.id)
    @item_select.save
    redirect_to user_item_selects_path
  end

  def update
  end

  def destroy

  end
 end