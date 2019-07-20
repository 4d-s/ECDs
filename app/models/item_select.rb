class ItemSelect < ApplicationRecord
	belongs_to :user
	belongs_to :item

	validates :item_count, :numericality => { :greater_than => 0 }
	validates :item_count, :numericality => { :less_than => 100 }
end
