class User::HomesController < ApplicationController
  def top
  	@rankings = Item.all.order(order_count: :desc)
  end
end
