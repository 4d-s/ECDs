class Admin::ItemsController < ApplicationController

  def index
  	@items = Item.page(params[:page]).per(3).reverse_order
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    disc = @item.discs.build
    disc.songs.build
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
      @item = Item.new(item_params)
      if @item.save
      redirect_to admin_path
      else
      redirect_to new_admin_item_path
      end
  end

  def update
    @item = Item.find(item_params)
    @item.update
    redirect_to admin_item_path
  end

  def destroy

  end

  private
  def item_params
    params.require(:item).permit(:artist_id, :label_id, :genre_id, :item_name, :stock, :price, :is_sold, :image, :order_count,
        discs_attributes:

        [:id, :disc_number, :item_id,

        songs_attributes:

        [:id, :song_number, :song_name]

     ]
  )
  end

end