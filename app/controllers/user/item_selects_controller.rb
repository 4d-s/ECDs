class User::ItemSelectsController < ApplicationController

  def index
    @item_selects = current_user.item_selects
  end

  def create
    @item = Item.find(params[:item_id])
    @item_select = current_user.item_selects.new(item_select_params)
    @item_select.item_id = @item.id
    if @item_select.save
      flash[:notice] = "商品をカートに追加しました"
      redirect_to user_item_selects_path
    end
  end

  def update
    @item_select = current_user.item_selects.find(params[:id])
    if @item_select.update(item_select_params)  #更新をdbへ反映
      flash[:notice] = "カートの内容を更新しました"
      redirect_to user_item_selects_path
    else
      redirect_to user_item_selects_path
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @item_select = current_user.item_selects.find_by(item_id: @item.id)
    if @item_select.destroy
       flash[:notice] = "商品をカートから削除しました"
       redirect_to user_item_selects_path
    else
      redirect_to user_item_selects_path
    end
  end

  private
    def item_select_params
      params.require(:item_select).permit(:item_count)
    end
 end