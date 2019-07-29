class OrderItemHistory < ApplicationRecord
	belongs_to :order
	attachment :image
end
