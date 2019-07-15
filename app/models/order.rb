class Order < ApplicationRecord
	belongs_to :user
	has_many :order_item_histories, dependent: :destroy
end
