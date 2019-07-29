class User::ItemSelectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item_selects = current_user.item_selects
  end

  def create
    @item = Item.find(params[:item_id])
    @item_selects = current_user.item_selects
    @item_select = current_user.item_selects.new(item_select_params)
    if @item_select.item_count > @item.stock
      flash[:notice] = "商品の在庫が足りない為、カートに商品を追加出来ませんでした"
      redirect_to user_item_path(@item)
      return
    end
    # 同一の商品が既にカートにある場合、その商品の個数を増やす。
    @item_selects.each{|item_select|
      if item_select.item_id == @item.id
        # カート内の商品の個数変更後の値が在庫数を超える場合には、追加出来ず商品詳細画面へ戻る
        if item_select.item_count + @item_select.item_count > item_select.item.stock
          flash[:notice] = "商品の在庫が足りない為、カートに商品を追加出来ませんでした。"
          redirect_to user_item_path(@item)
        return
        end
        item_select.update( item_count: item_select.item_count + @item_select.item_count )
        flash[:notice] = "同じ商品をカートに追加しました"
        redirect_to user_item_selects_path
        return
      end
    }
    @item_select.item_id = @item.id
    if @item_select.save
      flash[:notice] = "商品をカートに追加しました"
      redirect_to user_item_selects_path
    end
  end

  def update
    @item_select = current_user.item_selects.find(params[:id])
    if @item_select.update(item_select_params)  #更新をdbへ反映
      if @item_select.item_count > @item_select.item.stock
        @item_select.item_count = @item_select.item.stock
        @item_select.save
        flash[:notice] = "商品の在庫が足りない為、カートの内容を購入可能な個数に更新しました"
        redirect_to user_item_selects_path
        return
      end
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