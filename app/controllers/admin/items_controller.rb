class Admin::ItemsController < ApplicationController
before_action :authenticate_administrator!
  def index
  	 select_item_kind = params[:select_id]
    #CD名での検索
    if select_item_kind == "1"
      @items = Item.page(params[:page]).per(12).reverse_order.Item_search(params[:keyword])
    #アーティスト名での検索
  elsif  select_item_kind == "2"
    @items = Item.page(params[:page]).per(12).reverse_order.Artist_search(params[:keyword])
    #曲名での検索
  elsif select_item_kind == "3"
    @items = Item.page(params[:page]).per(12).reverse_order.Song_search(params[:keyword])
    #検索せずに全商品を表示
    else
      params[:keyword] = ""
      @items = Item.page(params[:page]).per(12).reverse_order
    end
  end

  def show
    @item = Item.find(params[:id])
    @discs = @item.discs
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @song = @disc.songs.build
  end
  def edit
    @item = Item.find(params[:id])
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = "登録しました"
        redirect_to admin_items_path
      else
        flash[:notice] = "登録できません。"
        render :new
      end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品内容を変更しました。"
      redirect_to admin_item_path
    else
      flash[:notice] = "変更内容の更新に失敗しました"
      redirect_to edit_admin_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy(item.id)
      flash[:notice] = "商品を削除しました。"
      redirect_to admin_items_path
    else
      flash[:notice] = "商品の削除に失敗しました。"
      redirect_to edit_admin_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:artist_id, :label_id, :genre_id, :item_name, :stock, :price, :is_sold, :image, :order_count, :_destroy,
        discs_attributes:

        [:id, :disc_number, :item_id, :_destroy,

        songs_attributes:

        [:id, :song_number, :song_name, :_destroy]

     ]
  )
  end
end
