class User::HomesController < ApplicationController
  def top
  	@items = Item.order(created_at: :desc)
  end
end
