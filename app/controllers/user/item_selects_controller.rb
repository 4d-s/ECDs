class User::ItemSelectsController < ApplicationController

  def index
  	@item_select = Item.find(session[:item_select])
  end

  def create
    session[:item_select] = [] unless session[:item_select]
    session[:item_select] << params[:item_id]
    session[:item_select] << params[:item_count]
    flash[:success] = "カートに商品を追加しました"
    redirect_to user_item_selects_path
  end

  def update
  end

  def destroy
  	session[:item_select] = nil
    redirect_to user_items_path
  end
 end