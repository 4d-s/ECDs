class User::ItemsController < ApplicationController
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
		@items = Item.page(params[:page]).per(12).reverse_order
	end
end
def show
	@item = Item.find(params[:id])
end
end

